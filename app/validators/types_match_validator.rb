class TypesMatchValidator < ActiveModel::Validator
  def validate(record)
    unless record.contestant.class == record.oponent.class
      record.errors[:type] << 'Contestant and oponent must be of same type'
    end
  end
end
