# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :programme do
    channel_id "MyString"
    start "2013-01-23 22:56:56"
    stop "2013-01-23 22:56:56"
    title "MyString"
    sub_title "MyString"
    desc "MyString"
    date 1
  end
end
