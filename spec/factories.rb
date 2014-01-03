FactoryGirl.define do
  factory :user do
    username "Corey"
    password  "example"
  end

  factory :friendship do
  	user_id '1'
  	friend_id '2'
  end
end