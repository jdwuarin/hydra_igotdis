class Match < ActiveRecord::Base

  has_many :user_match_predictions

  belongs_to :round
  has_one :tournament, through: :round
  belongs_to :receiving_contestant, class_name: 'TournamentContestant'
  belongs_to :invited_contestant, class_name: 'TournamentContestant'

  default_scope -> { order('date ASC') }

  validates :round, presence: true
  validates_presence_of :round
  validates :date, presence: true
  validates :receiving_contestant, presence: true
  validates_presence_of :receiving_contestant
  validates :invited_contestant, presence: true
  validates_presence_of :invited_contestant

  validates_with TypesMatchValidator
  validates_with ContestantsValidator
  validates_with DatesAreValid

  after_save :settle_predictions_if_over

  # make sure all match results are destroyed when a match is destroyed
  # before_destroy { |match| MatchResult.destroy_all "match_id = #{match.id}" }


  def to_s()
    "Match Id: " + self.id.to_s + ", Date: " + date.to_s
  end

  def settle_predictions_if_over
    if self.finished == true
      # all sorts of magic must happen
    end
  end

  # def settle_bets
  #   if self.winner == nil
  #     return
  #   end

  #   self.match.bets.each do |bet|
  #     user_account = bet.user.user_account
  #     if self.contestant == bet.winner && self.winner ||
  #       (self.contestant != bet.winner && !self.winner)
  #       credit_user_account(user_account, bet)
  #       user_account.save
  #       self.put_bet_in_bet_history(bet, true)
  #     else
  #       #money has already been taken out of account
  #       self.put_bet_in_bet_history(bet, false)
  #     end
  #   end
  # end

  def credit_user_tournament_point_standing(user_tournament_point_stading, prediction)
    if bet.type == RealBet
      user_account.money += bet.bet_size + bet.filled_size
    else
      user_account.play_money += bet.bet_size + bet.filled_size
    end
  end

  # def self.get_index_infos(page=1)
  #   matches_info = []
  #   lower_bound = (page-1)*20
  #   upper_bound = (20*page)-1

  #   matches = Match.where(
  #     finished: false).order(:date)[lower_bound..upper_bound]
  #   matches.each do |match|
  #     match_info = {}
  #     match_results = match.match_results
  #     if match_results.length == 0
  #       next
  #     end

  #     match_info[:tournament] = match.tournament.name
  #     match_info[:contestants_type] = match_results[0].contestant_type
  #     if match_info[:contestants_type] == "Player"
  #       match_info[:contestant1] = match_results[0].contestant.username
  #       match_info[:contestant2] = match_results[0].oponent.username
  #     else
  #       match_info[:contestant1] = match_results[0].contestant.name
  #       match_info[:contestant2] = match_results[0].oponent.name
  #     end
  #     matches_info.push(match_info)
  #   end
  #   matches_info
  # end
end




