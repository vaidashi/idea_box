FactoryGirl.define do
  factory :idea do
    sequence(:title) do |n|
     "My Idea's Title#{n}"
   end
    description "My Idea's Description"
    category
    user
  end
end
