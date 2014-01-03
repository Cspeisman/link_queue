require 'spec_helper'

describe User do
  describe "#authenticate" do 
  	it "returns a user if the username and password match" do
  		user = FactoryGirl.create(:user)
  		User.authenticate(user.username, "example").should be_an_instance_of(User) 
  	end

  	it "returns nil if a username and password do not match" do
  		user = FactoryGirl.create(:user)
  		User.authenticate(user.username, "notright").should be_nil
  	end
  end

  describe "#search" do
  	before(:all) do 
      10.times { |i| User.create(username:"test_name#{i}", password: 'whocares')}
    end
    after(:all) do 
      User.destroy_all
    end
    it 'returns an array of users with similar names' do
      User.search('name').length.should == 10
    end
  end

  describe '#accepted_friends' do 
    it "is empty if user has no accepted friends" do 
      user = FactoryGirl.create(:user)
      10.times { |i| user.friends << User.create(username:"test_name#{i}", password: 'whocares')}
      user.accepted_friends.length.should == 0
    end
    
    it "returns all the users accepted friends" do 
      user = FactoryGirl.create(:user)
      10.times do |i|
        i_user = User.create(username:"test_name#{i}", password: 'whocares')
        if i % 2 == 0
          Friendship.create(user_id: user.id, friend_id: i_user.id, friendship_accepted: true )
        else
          Friendship.create(user_id: user.id, friend_id: i_user.id)
        end
      end
      user.accepted_friends.length.should == 5
    end
  end
end
