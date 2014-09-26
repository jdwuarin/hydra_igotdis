class MatchResultsValidator < ActiveModel::Validator
  def validate(record)
    if record.finished
      tournament_type = record.round.tournament.tournament_type

      if tournament_type == TournamentTypes::LOL_WORLD_CUP
       validate_lwc_results(record)
      end

    end
  end

  def validate_lwc_results(record)

  end

end