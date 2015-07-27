FactoryGirl.define do
  factory :post do
    association :user
    content { Faker::Lorem.paragraphs(5).join("\n\n") }

    trait :with_comments do
      after(:create) do |post, _|
        post.comments = create_list(:comment, 10)
      end
    end
  end
end
