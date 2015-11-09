FactoryGirl.define do
  factory :customer do
    sequence(:full_name) { |n| "first_name_#{n} last_name_#{n}" }
    sequence(:first_name) { |n| "first_name_#{n}" }
    sequence(:last_name) { |n| "last_name_#{n}" }
    phone "02123456789"
    sequence(:email) { |n| "customer#{n}@example.com" }
  end
end
