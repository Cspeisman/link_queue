class HomeController < ApplicationController
	def index
		if !session[:user_id]
			redirect_to log_in_path
		else
			@friends = current_user.friends
			@requests = friend_requests.map {|x| User.find(x.friend_id)} if !friend_requests.empty?
		end
	end
end
