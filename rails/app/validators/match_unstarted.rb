class MatchUnstarted < ActiveModel::Validator

  def validate(record)
    # if other errors, return
    return unless record.errors.blank?

    if record.match
      unless record.match.date > Time.now
          record.errors[:time] << 
            "match has already started, can't do predictions on it anymore"
      end
    end

  end
end