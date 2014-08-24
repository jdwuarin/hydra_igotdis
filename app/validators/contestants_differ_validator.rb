class ContestantsDifferValidator < ActiveModel::Validator
  def validate(record)
    if record.receiving_contestant.id == record.invited_contestant.id
      record.errors[:id] << 'Contestants must be different'
    end
  end
end
