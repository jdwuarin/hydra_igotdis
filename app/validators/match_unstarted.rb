class MatchUnstarted < ActiveModel::Validator

  def validate(record)

    if record.match
      unless record.match.date > DateTime.now
          record.errors[:time] << 
            "match has already started, can't do predictions on it anymore"
      end
    end

  end
end