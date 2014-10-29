class RoundTypeValidator < ActiveModel::Validator
  def validate(record)
    unless RoundTypes::LIST[record.round_type]
      record.errors[:type] << 
        'round type was not valid.'
    end
  end
end
