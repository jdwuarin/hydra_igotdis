class PredictionHasAppropriatePredictionType < ActiveModel::Validator
  def validate(record)
    if record.prediction_type

      prediction_type_group = Enums::PREDICTION_TYPES[record.prediction_type][2]

      if record.class == UserRoundPrediction
        unless prediction_type_group == Enums::ROUND_PREDICTION
          record.errors[:type] << 
            'user_round_prediction\'s prediction type is not appropriate'
        end

      elsif record.class == UserMatchPrediction
        unless prediction_type_group == Enums::MATCH_PREDICTION
          record.errors[:type] << 
            'user_match_prediction\'s prediction type is not appropriate'
        end
      end

    end


  end

end
