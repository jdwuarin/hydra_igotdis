# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name "Example Team"
    continent_id 1
    game_id 1
  end

  factory :receiving_contestant, class: Team do
    name "receiving contestant"
    continent_id 1
    game_id 1
  end

  factory :invited_contestant, class: Team do
    name "invited contestant"
    continent_id 1
    game_id 1
  end
end