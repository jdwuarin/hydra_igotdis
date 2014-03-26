class WinnerParticipatedInMatch < ActiveModel::Validator
  def validate(bet)
    mr = bet.match.match_results
    if mr.length < 2
      bet.errors[:match] << "Could not find any match_results for match"  
    elsif mr[0].contestant != bet.winner && mr[0].oponent != bet.winner
      bet.errors[:winner] << "Winner could not be found in match..."
    end
  end
end

class OddsFormatIsValid < ActiveModel::Validator
  def validate(bet)
    odds = bet.odds
    if odds.count(":") != 1
      bet.errors[:odds] << "Odds must contain exactly one ':'"
    else
      left = odds.split(":")[0]
      right = odds.split(":")[1]
      begin
        Integer(left)
        integer(right)
      rescue ArgumentError
        bet.errors[:odds] << "Odds must only contain integer numbers ':'"
      end
    end
  end
end


def normalize_and_get_matching_odds(odds_string)
  # we then compute the wanted betting odds level
  # we are assuming here that odds are calculated against a team/player
  # i.e if I quote 3:1 I am betting 3 to 1 agains a team/player winning
  odds_array = odds_string.split(":")
  odds_against = Integer(odds_array[0])
  odds_for = Integer(odds_array[1])
  divisor = odds_agains.gcd(odds_for) #should almost always be 1

  odds_against /= divisor
  odds_for /= divisor
  true_odds = odds_against.to_s.concat(":").concat(odds_for.to_s)
  matching_odds = odds_for.to_s.concat(":").concat(odds_against.to_s)

  return true_odds, matching_odds
end


class Bet < ActiveRecord::Base

  belongs_to :match
  belongs_to :winner, polymorphic: true
  belongs_to :user

  #validation part
  validates :odds, presence: true
  validates :bet_size, presence: true
  validates :match_id, presence: true
  validates :winner_id, presence: true
  validates :user_id, presence: true
  validates_presence_of :match #validates the association (i.e make sure foreign key exists)
  validates_presence_of :winner
  validates_presence_of :user

  validates_with WinnerParticipatedInMatch
  validates_with OddsFormatIsValid

  before_save :try_filling_related_bets


  def try_filling_related_bets

    # try finding all bets on the current match on the winners oponent at the
    # wanted level

    # we already have the match we want, so we get the wanted winner
    oponent_id = MatchResult.find_by(
      match_id: self.match_id,
      contestant_id = self.winner_id).contestant_id

    self.odds, matching_odds = normalize_and_get_matching_odds(self.odds)


    if self.winner != nil
      related_match_result.update_columns(
        winner: !self.winner) # related winner boolean should be opposite
    end
  end

end

