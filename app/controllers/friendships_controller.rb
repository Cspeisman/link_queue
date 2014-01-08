class FriendshipController < ApplicationController
	
	def create_friendship
		friend_id = params[:friend_id]
		# friendship = Friendship.where(user_id: current_user.id, friend_id: friend_id).first
		Friendship.accept_friendship(current_user.id, friend_id)
		redirect_to root_url
	end

	def show
		@friendship = Friendship.find(current_user.id, params[:friend_id])
	end

end