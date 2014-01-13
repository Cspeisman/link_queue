class ChangeLinkFriendshipIdFormat < ActiveRecord::Migration
  def change
 		change_column :links, :friendship_id, 'integer USING CAST(friendship_id AS integer)'
  end
end
