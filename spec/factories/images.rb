FactoryGirl.define do
  factory :image do
    sequence(:name) do |n|
      "Image Name#{n}"
    end
    image_path "https://deadrabbit.barstoolsports.net/wp-content/uploads/2017/05/25/episode-26-1920.jpg"
  end
end
