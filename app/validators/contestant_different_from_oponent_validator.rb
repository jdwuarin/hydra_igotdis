class ContestantDifferentFromOponentValidator < ActiveModel::Validator
  def validate(record)
    if record.contestant.id == record.oponent.id
      record.errors[:id] << 'Contestant and oponent cannot be the same'
    end
  end
end
