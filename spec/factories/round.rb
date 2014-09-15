FactoryGirl.define do
  factory :round do
    tournament
    round_type 2
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
    receiving_contestant
    invited_contestant
  end

  factory :bracket do
    tournament
    round_type 1
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round false
    receiving_contestant nil
    invited_contestant nil
  end

  factory :quarter_final do
    tournament
    round_type 2
    points_multiplier 3
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
    receiving_contestant
    invited_contestant
  end

  factory :semi_final do
    tournament
    round_type 3
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
    receiving_contestant
    invited_contestant
  end
end