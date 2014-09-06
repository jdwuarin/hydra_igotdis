class RoundDirectEliminationValidation < ActiveModel::Validator
  def validate(record)
    contestant_1_is_nil = record.receiving_contestant == nil
    contestant_2_is_nil = record.invited_contestant == nil

    if record.is_direct_elimination_round == false
      unless contestant_1_is_nil && contestant_2_is_nil
        record.errors[:content] << 
          'round is not a direct elimination round and can thus have more than
           two contestants. You should not specify them here at this stage'
      end
    elsif record.is_direct_elimination_round == true
      unless !contestant_1_is_nil && !contestant_2_is_nil
        record.errors[:content] << 
          'round is a direct elimination round and can thus have only
           two contestants that should be specified at this stage'
      end
    end
  end
end
