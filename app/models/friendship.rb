class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"
	has_many :links
	
	validates :user_id, :friend_id, presence: true

	def self.accept_friendship(user_id, friend_id)
		where(user_id: user_id, friend_id: friend_id).first.update(friendship_accepted: true)
		Friendship.new(user_id: friend_id, friend_id: user_id, friendship_accepted: true).save
	end

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

	def self.find(user,friend)
		where(user_id: user, friend_id: friend).first
	end
end
