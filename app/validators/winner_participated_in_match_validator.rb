class WinnerParticipatedInMatchValidator < ActiveModel::Validator
  def validate(bet)
    mr = bet.match.match_results
    if mr.length < 2
      bet.errors[:match] << "Could not find any match_results for match"  
    elsif mr[0].contestant != bet.winner && mr[0].oponent != bet.winner
      bet.errors[:winner] << "Winner could not be found in match..."
    end
  end
end