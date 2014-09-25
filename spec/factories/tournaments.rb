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

  factory :tournament_with_groups, parent: :tournament do
    has_groups true
    group_count 4
    group_naming_convention GroupNamingConventions::LETTERS
  end

  factory :LWC_tournament, parent: :tournament_with_groups do
    start_date { Time.new(2014, 9, 18).change(:offset => "+0200") }
    end_date { Time.new(2014, 10, 19, 23, 59, 59).change(:offset => "+0200") }
    name "LOL World Championship 2014"
    tournament_type TournamentTypes::LOL_WORLD_CUP
  end

end
