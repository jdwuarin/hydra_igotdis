class DatesAreValid < ActiveModel::Validator
  def validate(record)
    if record.class == Tournament
      self.validate_tournament_dates(record)

    elsif record.class == Round
      self.validate_round_dates(record)

    elsif record.class == Match
      self.validate_match_date(record)

    end
  end

  def validate_tournament_dates(record)
    self.validate_start_date_before_end_date(record)
  end

  def validate_round_dates(record)
    self.validate_start_date_before_end_date(record)
    self.validate_date_in_parent_bounds(record,
                                        record.start_date,
                                        record.tournament.start_date,
                                        record.tournament.end_date)
    if record.end_date != nil
      self.validate_date_in_parent_bounds(record,
                                          record.end_date,
                                          record.tournament.start_date,
                                          record.tournament.end_date)
    end
  end

  def validate_match_date(record)
    self.validate_date_in_parent_bounds(record,
                                        record.date,
                                        record.round.start_date,
                                        record.round.end_date)
  end

  def validate_start_date_before_end_date(record)
    if record.start_date != nil && record.end_date != nil
      unless record.start_date < record.end_date
        record.errors[:id] << record.class.to_s + 
          ' start date must be before end date'
      end
    end
  end

  def validate_date_in_parent_bounds(record, value, lower_bound, upper_bound)
    unless value >= lower_bound && value <= upper_bound
      record.errors[:id] << record.class.to_s + 
        'must occur during the round/tournament'
    end
  end

end
