# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name
    continent_id Continents::ASIA
    game_id Games::LOL
    logo "no fucking logo for now. Change fucking soon"
  end

  factory :LWC_fnatic, parent: :team do
    name "Fnatic"
    logo "Fnatic logo src"
  end

  factory :LWC_taipei_assassins, parent: :team do
    name "Taipei Assassins"
    logo "Taipei Assassins logo"
  end

end