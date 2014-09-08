class ContestantsValidator < ActiveModel::Validator
  def validate(record)
    if record.receiving_contestant != nil # just to account for Rounds of type 1
      if record.receiving_contestant.id == record.invited_contestant.id
        record.errors[:id] << 'Contestants must be different'
      end
    end

    if record.class == Match && record.round.is_direct_elimination_round
      cond_1 = record.receiving_contestant == record.round.receiving_contestant
      cond_2 = record.invited_contestant == record.round.invited_contestant
      unless cond_1 and cond_2
        record.errors[:type] << 'match contestants must be the same as
                                 the round contestants in direct
                                 elimination rounds'
      end
    end

  end
end
