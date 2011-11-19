FactoryGirl.define do
  factory :user do
    name    'diego'
    surname 'giorgini'
    sequence(:email)    { |n| "email#{n}@factory.com" }
    sequence(:nickname) { |n| "nick_#{n}" }
  end
end
