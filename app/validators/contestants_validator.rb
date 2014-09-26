class ContestantsValidator < ActiveModel::Validator
  def validate(record)

    contestant_1 = record.receiving_contestant.contestant
    contestant_2 = record.invited_contestant.contestant

    unless contestant_1 != contestant_2
      record.errors[:id] << 'Contestants must be different'
    end

  end
end
