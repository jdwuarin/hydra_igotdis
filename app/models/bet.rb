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

  after_create :try_filling_related_bets


  def try_filling_related_bets

    # try finding all bets on the current match on the winners oponent at the
    # wanted level

    # we already have the match we want, so we get the wanted winner
    oponent_id = MatchResult.find_by(
      match_id: self.match_id,
      contestant_id = self.winner_id).oponent_id

    self.odds, matching_odds = self.normalize_set_filled_max_and_get_matching_odds

    matching_bets = Bet.where(winner_id: oponent_id,
                              odds: matching_odss,
                              filled: false).order(:created_at)
    matched_quantity = self.update_matching_bets(matching_bets)


  end

  def normalize_and_get_matching_odds_and_filled_max
    # we then compute the wanted betting odds level
    # we are assuming here that odds are calculated against a team/player
    # i.e if I quote 3:1 I am betting 3 to 1 agains a team/player winning
    odds_string = self.odds
    odds_array = odds_string.split(":")
    odds_against = Integer(odds_array[0])
    odds_for = Integer(odds_array[1])
    divisor = odds_agains.gcd(odds_for) #should almost always be 1

    odds_against /= divisor
    odds_for /= divisor
    true_odds = odds_against.to_s.concat(":").concat(odds_for.to_s)
    matching_odds = odds_for.to_s.concat(":").concat(odds_against.to_s)
    self.filled_max = (BigDecimal.new(self.bet_size.to_s)*odds_against)/odds_for

    return true_odds, matching_odds
  end

  def update_matching_bets(matching_bets)
    # the running value of how much this bet was filled
    bet_filled_size = BigDecimal.new("0")
    matching_bets.each do |matching_bet|
      #determine available quantity in matching_bet
      to_fill = BigDecimal.new(matching_bet.filled_max.to_s) - 
                    BigDecimal.new(matching_bet.filled_size.to_s)
      matching_bet_filled_quantity


  end

end

