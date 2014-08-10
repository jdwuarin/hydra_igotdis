class MatchResult < ActiveRecord::Base

  belongs_to :match
  belongs_to :contestant, polymorphic: true
  has_one :tournament, through: :match
  belongs_to :oponent, polymorphic: true #should be of the same class as the contestant

  validates :match_id, presence: true
  validates :contestant_id, presence: true
  validates :oponent_id, presence: true
  # validates_presence_of :match
  validates_presence_of :contestant
  validates_presence_of :oponent

  validates_with TypesMatchValidator
  validates_with ContestantDifferentFromOponentValidator

  after_save :check_related_match_result
  after_save :settle_bets


  def check_related_match_result
    match = self.match
    # find the corresponding match_result if it exists
    related_match_result = MatchResult.find_or_create_by(
      match_id: match.id, 
      contestant_id: self.oponent_id,
      contestant_type: self.oponent_type,
      oponent_id: self.contestant_id,
      oponent_type: self.contestant_type)

    if self.winner != nil
      related_match_result.update_columns(
        winner: !self.winner) # related winner boolean should be opposite
    end
  end


  def settle_bets
    if self.winner == nil
      return
    end

    self.match.bets.each do |bet|
      user_account = bet.user.user_account
      if self.contestant == bet.winner && self.winner ||
        (self.contestant != bet.winner && !self.winner)
        credit_user_account(user_account, bet)
        user_account.save
        self.put_bet_in_bet_history(bet, true)
      else
        #money has already been taken out of account
        self.put_bet_in_bet_history(bet, false)
      end
    end
  end

  def credit_user_account(user_account, bet)
    if bet.type == RealBet
      user_account.money += bet.bet_size + bet.filled_size
    else
      user_account.play_money += bet.bet_size + bet.filled_size
    end
  end

  def put_bet_in_bet_history(bet, user_won)
    BetHistory.create!(match: bet.match,
                       winner: bet.winner,
                       winner_type: bet.winner_type,
                       odds: bet.odds,
                       user: bet.user,
                       created_at: bet.created_at,
                       bet_size: bet.bet_size,
                       filled_size: bet.filled_size,
                       filled: bet.filled,
                       filled_max: bet.filled_max,
                       type: bet.type,
                       user_won: user_won)
    bet.destroy
  end

end