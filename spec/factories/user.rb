FactoryGirl.define do
  factory :user do
    name                   "RSpec Account"
    email                   { Faker::Internet.email }
    password                "abc123456"
    password_confirmation   "abc123456"
  end
end