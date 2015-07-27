FactoryGirl.define do
  factory :post do
    association :user
    content { Faker::Lorem.paragraphs(5).join("\n\n") }
  end
end
