FactoryGirl.define do
  factory :round do
    tournament
    round_type RoundTypes::QUARTER_FINAL
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
    receiving_contestant
    invited_contestant
  end

  factory :LWC_group_stage, class: Round do
    association :tournament, factory: :LWC_tournament
    round_type RoundTypes::GROUP_STAGE
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round false
    receiving_contestant nil
    invited_contestant nil
  end

  factory :LWC_quarter_final, class: Round do
    association :tournament, factory: :LWC_tournament
    round_type RoundTypes::QUARTER_FINAL
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
    association :receiving_contestant, factory: :LWC_receiving_contestant
    association :invited_contestant, factory: :LWC_invited_contestant
  end

  factory :LWC_semi_final, class: Round do
    association :tournament, factory: :LWC_tournament
    round_type RoundTypes::SEMI_FINAL
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
    association :receiving_contestant, factory: :LWC_receiving_contestant
    association :invited_contestant, factory: :LWC_invited_contestant
  end

  factory :LWC_final, class: Round do
    association :tournament, factory: :LWC_tournament
    round_type RoundTypes::FINAL
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
    association :receiving_contestant, factory: :LWC_receiving_contestant
    association :invited_contestant, factory: :LWC_invited_contestant
  end

end