class PredictedContestantParticipated < ActiveModel::Validator

  def validate(record)
    # if other errors, return
    return unless record.errors.blank?

    predicted_contestant = record.predicted_contestant
    if predicted_contestant

      receiving_contestant = record.match.receiving_contestant
      invited_contestant = record.match.invited_contestant
      condition_1 = predicted_contestant == receiving_contestant
      condition_2 = predicted_contestant == invited_contestant
      unless condition_1 || condition_2
        record.errors[:type] << 
          'user_match_prediction\'s predicted_contestant should be in match'

      end
    end
  end

end