# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tournament_contestant do
    tournament
    association :contestant, factory: :team
  end

  factory :LWC_tournament_contestant,
          class: TournamentContestant do
    association :tournament, factory: :LWC_tournament
    association :contestant, factory: :LWC_receiving_contestant
    group_id Groups::GROUP_A
  end

end
