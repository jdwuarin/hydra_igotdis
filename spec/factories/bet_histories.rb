# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bet_history do
    match_id 1
    winner_id ""
    odds "9.99"
    user_id 1
    bet_size "9.99"
    filled_size "9.99"
  end
end
