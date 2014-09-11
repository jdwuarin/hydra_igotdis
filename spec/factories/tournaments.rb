# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tournament do
    name "Example Tournament"
    game_id 1
    start_date DateTime.yesterday
    end_date DateTime.tomorrow
    venue
    continent_id 1
  end
end
