FactoryGirl.define do
  factory :user do
    sequence(:username) do |n|
       "Username#{n}"
     end
    password_digest "MyPassword"
  end
end
