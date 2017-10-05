FactoryGirl.define do
  factory :comment do
    commentable nil
    body "MyText"
    published_at "2017-10-06 00:16:30"
  end
end
