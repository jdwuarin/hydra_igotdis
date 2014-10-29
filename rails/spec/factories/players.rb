# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    username
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    player_position
    date_of_birth { 20.years.ago }
    continent_id Continents::ASIA
    game_id Games::LOL
  end
end
