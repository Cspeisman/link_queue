class FriendshipsController < ApplicationController
	
	def create
		friend_id = params[:friend_id]
		# friendship = Friendship.where(user_id: current_user.id, friend_id: friend_id).first
		Friendship.accept_friendship(current_user.id, friend_id)
		redirect_to root_url
	end

	def show
		params[:friend_id] ? @friendship = find_friendship(params[:friend_id]) : @friendship = Friendship.find(params[:id])
		@links = @friendship.links
	end

	private

	def find_friendship(friend_id)
		Friendship.find_by_users(current_user.id, params[:friend_id])
	end
end