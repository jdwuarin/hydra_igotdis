# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tournament_contestant, aliases:
          [:receiving_contestant, :invited_contestant] do
    tournament
    association :contestant, factory: :team
  end

  factory :LWC_receiving_contestant,
          class: TournamentContestant do
    association :tournament, factory: :LWC_tournament
    association :contestant, factory: :LWC_ahq
    group_id Groups::GROUP_A
  end

  factory :LWC_invited_contestant,
          class: TournamentContestant do
    association :tournament, factory: :LWC_tournament
    association :contestant, factory: :LWC_samsung_galaxy_white
    group_id Groups::GROUP_A
  end

end
