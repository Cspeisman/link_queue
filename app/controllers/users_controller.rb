class UsersController < ApplicationController
	before_action :authorize, except: [:new, :create]
	
	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Sign up!"
		else
			render 'new'
		end
	end

	def search
		if request.post?
			if params[:username].empty?
				flash[:notice] = "Please specify a user to search"
				redirect_to users_search_path
			else
				@users = User.search(params[:username])
				render 'show'
			end
		end
	end

	def add_friend
		User.find(params[:friend]).friends << current_user
		redirect_to root_url
	end

	private

	def authorize
		if !current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to log_in_path
    end
	end


	def user_params
		params.require(:user).permit(:username, :password)
	end
end