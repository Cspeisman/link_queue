require 'spec_helper'

describe Friendship do
  friendship = FactoryGirl.create(:friendship)
  it "should have friendship_accepted be false by default" do 
  	friendship.friendship_accepted.should == false
  end

  describe "#create" do 
  end

  describe "#accept_friendship" do 
  	it "should turn friendship_accepted to true" do 
  		friendship.accept_friendship
  		friendship.friendship_accepted.should == true
  	end
  end

  describe "#destroy" do 
  end
end
