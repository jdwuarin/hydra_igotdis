# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name
    continent_id 1
    game_id 1
  end

  factory :receiving_contestant, class: Team do
    name
    continent_id 1
    game_id 1
  end

  factory :invited_contestant, class: Team do
    name
    continent_id 1
    game_id 1
  end
end