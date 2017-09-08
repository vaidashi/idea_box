FactoryGirl.define do
  factory :user do
    sequence(:username) do |n|
       "Username#{n}"
     end
    password_digest "MyPassword"

    factory :user_with_ideas do
      after(:create) do |user|
        create_list(:idea, 2 ,:user => user)
      end
    end 
  end
end
