class HomeController < ApplicationController
	def index
		if !current_user
			redirect_to log_in_path
		else
			@friends = current_user.accepted_friends
			@requests = friend_requests.map {|x| User.find(x.friend_id)} if !friend_requests.empty?
		end
	end
end
