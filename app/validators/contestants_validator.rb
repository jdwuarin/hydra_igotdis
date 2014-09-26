class ContestantsValidator < ActiveModel::Validator
  def validate(record)

    # if other errors, return
    return unless record.errors.blank?

    contestant_1 = record.receiving_contestant.contestant
    contestant_2 = record.invited_contestant.contestant

    unless contestant_1 != contestant_2
      record.errors[:id] << 'Contestants must be different'
    end

    tournament_1 = record.receiving_contestant.tournament
    tournament_2 = record.invited_contestant.tournament

    unless tournament_1 == tournament_2
      record.errors[:id] << 'Contestants must be in same tournament'
    end

  end
end
