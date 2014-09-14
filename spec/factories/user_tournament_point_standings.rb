# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_tournament_point_standing do
    user
    tournament
    points 0
  end
end
