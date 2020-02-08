FactoryBot.define do
  factory :entry do
    user

    posted_at        { Time.current     }
    sequence(:body)  { "Sample Body"    }
    sequence(:title) { |n| "Post ##{n}" }
  end
end
