FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    name "Test User"
    nickname "Test"
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
