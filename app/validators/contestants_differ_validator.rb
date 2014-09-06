class ContestantsDifferValidator < ActiveModel::Validator
  def validate(record)
    if record.receiving_contestant != nil # just to account for Rounds of type 1
      if record.receiving_contestant.id == record.invited_contestant.id
        record.errors[:id] << 'Contestants must be different'
      end
    end
  end
end
