# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name
    continent_id Continents::ASIA
    game_id Games::LOL
    logo "no fucking logo for now. Change fucking soon"
  end

  factory :receiving_contestant_team, parent: :team do
    game_id Games::DOTA #just because
  end

  factory :invited_contestant_team, parent: :team do
    game_id Games::DOTA
  end

  factory :LWC_receiving_contestant, parent: :team do
    name "Fnatic"
    logo "Fnatic logo src"
  end

  factory :LWC_invited_contestant, parent: :team do
    name "Taipei Assassins"
    logo "Taipei Assassins logo"
  end

end