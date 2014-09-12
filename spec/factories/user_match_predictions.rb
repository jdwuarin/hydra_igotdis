FactoryGirl.define do
  factory :user_match_predictions do
    match
    prediction_type 1
    predicted_contestant { match.receiving_contestant }
    user
  end
end