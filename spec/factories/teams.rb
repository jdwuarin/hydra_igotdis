# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name
    continent_id Continents::ASIA
    game_id Games::LOL
    logo "don't care"
  end

  factory :LWC_ahq, parent: :team do
    name "AHQ"
    logo "/assets/teams/ahq_logo.png"
  end

  factory :LWC_samsung_galaxy_white, parent: :team do
    name "Samsung White"
    logo "/assets/teams/samsung_galaxy_white_logo.png"
  end

end