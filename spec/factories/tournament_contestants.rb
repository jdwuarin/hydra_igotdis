# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tournament_contestant do
    tournament
    contestant 
    end_date { 2.days.from_now }
    continent_id Continents::ASIA
    tournament_type TournamentTypes::LOL_WORLD_CUP
  end
end
