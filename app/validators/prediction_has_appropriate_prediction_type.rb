class PredictionHasAppropriatePredictionType < ActiveModel::Validator
  def validate(record)
    prediction_type_group = prediction_types[record.prediction_type][2]
    is_round = prediction_type_group == ROUND_PREDICTION
    is_match = prediction_type_group == MACTH_PREDICTION
    is_agnostic = prediction_type_group == MACTH_PREDICTION

    if record.class == UserRoundPrediction
      unless is_round || is_agnostic
        record.errors[:type] << 
          'user_round_prediction\'s prediction type is not appropriate'
      end

    elsif record.class == UserMatchPrediction
      unless is_match || is_agnostic
        record.errors[:type] << 
          'user_match_prediction\'s prediction type is not appropriate'
      end
    end

  end

end
