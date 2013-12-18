class HomeController < ApplicationController
	def index
		if !current_user
			redirect_to log_in_path
		else
			@friends = current_user.accepted_friends
			@requests = friend_requests.map {|x| User.find(x.friend_id)} if !friend_requests.empty?
		end
	end

	def create_friendship
		friend_id = params[:friend_id]
		friendship = Friendship.where(user_id: current_user.id, friend_id: friend_id).first
		friendship.accept_friendship
		redirect_to root_url
	end
end
