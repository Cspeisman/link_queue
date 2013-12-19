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
  	it 'returns an array of users with similar names' do
  	end
  end
end
