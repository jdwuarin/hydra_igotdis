# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match_result do
    match_id 1
    contestant_id 1
    winner false
    kills 1
    num_tower_destroyed 1
  end
end
