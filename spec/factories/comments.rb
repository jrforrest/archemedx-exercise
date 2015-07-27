FactoryGirl.define do
  factory :comment do
    association :author, factory: :user
    body { Faker::Lorem.paragraphs(2).join("\n\n") }

    trait :nested do
      association :parent, factory: :comment
    end
  end
end
