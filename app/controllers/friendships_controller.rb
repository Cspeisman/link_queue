class FriendshipsController < ApplicationController
	
	def create
		friend_id = params[:friend_id]
		Friendship.accept_friendship(current_user.id, friend_id)
		redirect_to root_url
	end

	def show
		@friendship = Friendship.find(params[:id])
		@links = @friendship.links
	end

	def find_friendship
		friendship = Friendship.find_by_users(current_user.id, params[:friend_id])
		redirect_to friendship_path(friendship)
	end

end