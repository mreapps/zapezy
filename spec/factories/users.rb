FactoryGirl.define do
  factory :user do
    firstname 'Test firstname'
    lastname 'Test lastname'
    email 'example@example.com'
    password 'please123'
    password_confirmation 'please123'
    confirmed_at Time.now
  end
end
