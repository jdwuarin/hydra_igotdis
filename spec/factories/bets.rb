# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bet do
    match_id 1
    winner 1
    odds "9.99"
    amount "9.99"
    user_id 1
  end
end
