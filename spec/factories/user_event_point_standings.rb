# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_event_point_standing do
    user_id 1
    tournament_id 1
    points 1
  end
end
