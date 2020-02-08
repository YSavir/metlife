FactoryBot.define do
  factory :user do
    name             { |n| "Bob ##{n}"          }
    sequence(:email) { |n| "user#{n}@email.com" }

    password         { "password123"            }
  end
end
