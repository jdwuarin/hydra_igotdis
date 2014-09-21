FactoryGirl.define do
  factory :user_round_prediction do
    round
    prediction_type 6
    predicted_contestant { round.receiving_contestant }
    comment "Some random comment"
    user
  end

  factory :LWC_user_round_prediction,
          parent: :user_round_prediction do
    association :round, factory: :LWC_quarter_final
  end

end