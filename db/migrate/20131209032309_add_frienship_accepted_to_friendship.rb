class AddFrienshipAcceptedToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :friendship_accepted, :boolean, default: false
  end
end
