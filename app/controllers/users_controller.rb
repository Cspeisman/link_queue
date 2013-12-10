class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url, :notice => "Sign up!"
		else
			render 'new'
		end
	end

	def search
		if request.post?
			@users = User.search(params[:username])
			render 'show'
		end
	end

	def add_friend
		User.find(params[:friend]).friends << current_user
		redirect_to root_url
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end
end