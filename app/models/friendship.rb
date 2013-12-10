class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"
	
	def create
		@friendship = Friendship.new(params[:friendship])
		if @friendship.save
			flash[:note] = "Successfully created friendship"
			redirect_to root_url
		else
			render :action => "new"
		end
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		@friendship.destroy
		flashp[:notice] = "Successfully destroyed friendship"
		redirect_to root_url
	end

	def accepted_friends
	end
	
end
