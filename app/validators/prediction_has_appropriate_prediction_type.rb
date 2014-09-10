class PredictionHasAppropriatePredictionType < ActiveModel::Validator
  def validate(record)
    prediction_type_group = prediction_types[record.prediction_type][2]

    if record.class == UserRoundPrediction
      unless prediction_type_group == ROUND_PREDICTION
        record.errors[:type] << 
          'user_round_prediction\'s prediction type is not appropriate'
      end

    elsif record.class == UserMatchPrediction
      unless prediction_type_group == MACTH_PREDICTION
        record.errors[:type] << 
          'user_match_prediction\'s prediction type is not appropriate'
      end
    end

  end

end
