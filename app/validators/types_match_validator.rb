class TypesMatchValidator < ActiveModel::Validator
  def validate(record)
    # if other errors, return
    return unless record.errors.blank?

    contestant_1_type = record.receiving_contestant.contestant_type
    contestant_2_type = record.invited_contestant.contestant_type
    unless contestant_1_type == contestant_2_type
      record.errors[:type] << 
        'receiving_contestant and invited_contestant must be of same type'
    end
  end
end
