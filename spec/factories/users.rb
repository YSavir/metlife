FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password { "password123" }
    name { |n| "Bob ##{n}" }
  end
end
