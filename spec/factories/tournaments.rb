# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tournament do
    name
    game_id 1
    start_date { 2.days.ago }
    end_date { 2.days.from_now }
    venue
    continent_id 1
  end
end
