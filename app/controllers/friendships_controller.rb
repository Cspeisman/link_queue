class FriendshipsController < ApplicationController
	before_filter :authorize
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def create
		friend_id = params[:friend_id]
		Friendship.accept_friendship(current_user.id, friend_id)
		redirect_to root_url
	end

	def show
		@links = {}
		@friendship = Friendship.find(params[:id])
		@links[:user_links] = @friendship.links
		@links[:friends_links] = Friendship.find_by_users(@friendship.friend_id, @friendship.user_id).links
		p "HERE ARE YOUR FUCKING LINKS"
		p @links
		redirect_to root_path if !@friendship.users_friendship?(current_user.id)
	end

	def find_friendship
		friendship = Friendship.find_by_users(current_user.id, params[:friend_id])
		redirect_to friendship_path(friendship)
	end
end