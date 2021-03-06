class Link < ActiveRecord::Base
	belongs_to :friendship
	has_many :comments
	validates :friendship_id, presence: true
	validates :url, format: { with: /https?:\/\/[\S]+/,
    message: "This does not appear to be a valid URL" }

	def self.link_allowed?(user_id, friend_id)
		friendship = Friendship.where(user_id: user_id, friend_id: friend_id).first
		friendship.friendship_accepted == true
	end
end
