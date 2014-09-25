class PredictionTypeValidator < ActiveModel::Validator

  def validate(record)

    # if other errors, return
    return unless record.errors.blank?

    unless PredictionTypes::LIST[record.prediction_type]
      record.errors[:type] << 
        'prediction_type was not valid.'
    end

    validate_tournament_specific_prediction_type(record)

  end

  def validate_tournament_specific_prediction_type(record)
    # LWC_2014 specific validation
    lwc = record.match.round.tournament.tournament_type
    if lwc == TournamentTypes::LOL_WORLD_CUP
      validate_lwc_2014_prediction_type(record, lwc)
    end
  end

  def validate_lwc_2014_prediction_type(record, lwc)
    round_type = record.match.round.round_type

    prediction_type = record.prediction_type
    prediction_class = nil

    if round_type == RoundTypes::GROUP_STAGE
      prediction_class = PredictionTypes::LWC_GROUP_STAGE

    elsif round_type == RoundTypes::QUARTER_FINALS
      prediction_class = PredictionTypes::LWC_QUARTER_FINALS

    elsif round_type == RoundTypes::SEMI_FINALS
      prediction_class = PredictionTypes::LWC_SEMI_FINALS

    else
      prediction_class = PredictionTypes::LWC_FINAL

    end

    condition = PredictionTypes::INFO[lwc][
      prediction_type]["available_in"].include? prediction_class

    unless condition
      round_name = RoundTypes::INFO[lwc][round_type]["name"]
      record.errors[:type] << 'Wrong prediction type for' + round_name
    end

  end

end
