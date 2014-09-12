FactoryGirl.define do
  factory :round do
    tournament
    round_type 2
    points_multiplier 2
    finished false
    start_date { 1.day.ago }
    end_date { 1.day.from_now }
    is_direct_elimination_round true
    receiving_contestant
    invited_contestant
  end
end