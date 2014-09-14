# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_tournament_score do
    user
    tournament
    score 0
  end
end
