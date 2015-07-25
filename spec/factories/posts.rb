FactoryGirl.define do
  factory :post do
    association :user
    content Faker::Lorem.paragraphs(5)
  end
end
