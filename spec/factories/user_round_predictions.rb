FactoryGirl.define do
  factory :user_round_prediction do
    round
    prediction_type 6
    predicted_contestant { round.receiving_contestant }
    comment "Some random comment"
    user
  end
end