FactoryGirl.define do
  factory :post do
    title "MyString"
    body "MyText"
    association :author, factory: :user
    published_at "2017-10-05 23:04:45"
  end
end
