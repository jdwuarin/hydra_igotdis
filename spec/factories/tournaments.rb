# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tournament do
    name
    start_date { 2.days.ago }
    end_date { 2.days.from_now }
    continent_id Continents::ASIA
    tournament_type TournamentTypes::DEFAULT_LOL
    game_id Games::LOL
    has_groups false
  end

  factory :LWC_tournament, parent: :tournament do
    name "LOL World Cup 2014"
    tournament_type TournamentTypes::LOL_WORLD_CUP
    has_groups true
    group_count 4
    group_naming_convention GroupNamingConventions::LETTERS
  end

end
