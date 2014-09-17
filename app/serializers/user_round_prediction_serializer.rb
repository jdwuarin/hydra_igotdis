class UserRoundPredictionSerializer < ActiveModel::Serializer
  attributes :id, :round, :prediction_type,
             :predicted_contestant_type, :predicted_contestant_id
end