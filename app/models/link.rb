class Link < ActiveRecord::Base
	belongs_to :friendship
	validates :friendship_id, presence: true

	def self.link_allowed?(user_id, friend_id)
		friendship = Friendship.where(user_id: user_id, friend_id: friend_id).first
		friendship.friendship_accepted == true
	end
end
