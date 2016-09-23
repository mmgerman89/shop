FactoryGirl.define do
  factory :one do
    email "ejemplo@tests.com"
    password  "123456"
    password_confirmation  "123456"
    admin false
  end

end