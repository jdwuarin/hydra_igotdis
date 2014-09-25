FactoryGirl.define do
  factory :round do
    tournament
    round_type RoundTypes::QUARTER_FINALS
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
  end

  # using change(:offset in order to get CEST which it is for the whole)
  # duration of the tournament
  factory :LWC_group_stage, class: Round do
    association :tournament, factory: :LWC_tournament
    round_type RoundTypes::GROUP_STAGE
    start_date { Time.new(2014, 9, 18).change(:offset => "+0200") }
    end_date { Time.new(2014, 9, 28, 23, 59, 59).change(:offset => "+0200") }
    is_direct_elimination_round false
  end

  factory :LWC_quarter_final, class: Round do
    association :tournament, factory: :LWC_tournament
    round_type RoundTypes::QUARTER_FINALS
    start_date { Time.new(2014, 10, 3).change(:offset => "+0200") }
    end_date { Time.new(2014, 10, 6, 23, 59, 59).change(:offset => "+0200") }
    is_direct_elimination_round true
  end

  factory :LWC_semi_final, class: Round do
    association :tournament, factory: :LWC_tournament
    round_type RoundTypes::SEMI_FINALS
    start_date { Time.new(2014, 10, 11).change(:offset => "+0200") }
    end_date { Time.new(2014, 10, 12, 23, 59, 59).change(:offset => "+0200") }
    is_direct_elimination_round true
  end

  factory :LWC_final, class: Round do
    association :tournament, factory: :LWC_tournament
    round_type RoundTypes::FINAL
    start_date { Time.new(2014, 10, 19).change(:offset => "+0200") }
    end_date { Time.new(2014, 10, 19, 23, 59, 59).change(:offset => "+0200") }
    is_direct_elimination_round true
  end

end