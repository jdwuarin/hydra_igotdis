class MatchDateDuringTournament < ActiveModel::Validator
  def validate(record)
    after_beginning = record.date >= record.tournament.start_date
    before_end = record.date <= record.tournament.end_date
    if after_beginning && before_end
      record.errors[:id] << 'Match mus occur during the tournament'
    end
  end
end
