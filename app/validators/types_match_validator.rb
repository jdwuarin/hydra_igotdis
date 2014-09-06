class TypesMatchValidator < ActiveModel::Validator
  def validate(record)
    if record.receiving_contestant != nil
      unless record.receiving_contestant.class == record.invited_contestant.class
        record.errors[:type] << 
          'receiving_contestant and invited_contestant must be of same type'
      end
    end
  end
end
