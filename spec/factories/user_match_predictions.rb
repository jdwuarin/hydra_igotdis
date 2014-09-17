FactoryGirl.define do
  factory :user_match_prediction do
    match
    prediction_type 1
    predicted_contestant { match.receiving_contestant }
    comment "Some random comment"
    user
  end

  factory :LWC_user_match_prediction,
          parent: :user_match_prediction do
    association :match, factory: :LWC_match
  end

end