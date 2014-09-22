class PredictionHasAppropriatePredictionType < ActiveModel::Validator

  def validate(record)
    if record.prediction_type

      prediction_type_group = PredictionTypes::INFO[record.prediction_type][1]

      if record.class == UserRoundPrediction
        unless prediction_type_group == PredictionTypes::ROUND_PREDICTION
          record.errors[:type] << 
            'user_round_prediction\'s prediction type is not appropriate'
        end

        if record.round
          validate_tournament_specific_prediction_type(record)
        end

      elsif record.class == UserMatchPrediction
        unless prediction_type_group == PredictionTypes::MATCH_PREDICTION
          record.errors[:type] << 
            'user_match_prediction\'s prediction type is not appropriate'
        end
      end
    end
  end

  def validate_tournament_specific_prediction_type(record)
    # LWC_2014 specific validation
    tt = record.round.tournament.tournament_type
    if tt == TournamentTypes::LOL_WORLD_CUP
      validate_lwc_2014_prediction_type(record)
    end
  end

  def validate_lwc_2014_prediction_type(record)
    rt = record.round.round_type
    if rt == RoundTypes::GROUP_STAGE
      record.errors[:type] << 'cannot do an actual prediction on this round'

    elsif rt == RoundTypes::QUARTER_FINALS
      condition_1 = record.prediction_type == PredictionTypes::SCORE_2_0
      condition_2 = record.prediction_type == PredictionTypes::SCORE_2_1
      unless condition_1 || condition_2
        record.errors[:type] << 'Wrong prediction type for Quarter finals'
      end

    else # semis or final
      condition_1 = record.prediction_type == PredictionTypes::SCORE_3_0
      condition_2 = record.prediction_type == PredictionTypes::SCORE_3_1
      condition_3 = record.prediction_type == PredictionTypes::SCORE_3_2
      unless condition_1 || condition_2 || condition_3
        record.errors[:type] << 'Wrong prediction type for Semis or Final'
      end
    end
  end

end
