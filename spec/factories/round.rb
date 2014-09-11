FactoryGirl.define do
  factory :round do
    tournament
    round_type 2
    points_multiplier 2
    finished false
    start_date DateTime.yesterday + 1.hour
    end_date DateTime.yesterday + 1.day
    is_direct_elimination_round true
    receiving_contestant FactoryGirl.create(:team)
    invited_contestant FactoryGirl.create(:team, name: "E.G. 2")
  end
end