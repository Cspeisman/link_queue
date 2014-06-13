require 'bcrypt'
class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  
	include BCrypt

	validates :password, presence: true
	validates :username, presence: true
	
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def accepted_friends
    self.friendships.where(friendship_accepted: true).map {|x| User.find(x.friend_id)}
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.search(username)
    where("username LIKE :query", query: '%#{username}%')
  end
end
