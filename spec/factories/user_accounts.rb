# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_account do
    user_id 1
    play_money "9.99"
    money "9.99"
    currency_id 1
  end
end
