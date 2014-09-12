FactoryGirl.define do
  factory :user_round_prediction do
    round
    prediction_type 6
    predicted_contestant { round.receiving_contestant }
    user
  end
end