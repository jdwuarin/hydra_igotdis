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
  validates_with MatchResultsValidator

  after_save :settle_predictions_if_over

  serialize :results, ActiveRecord::Coders::NestedHstore

  # make sure all match results are destroyed when a match is destroyed
  # before_destroy { |match| MatchResult.destroy_all "match_id = #{match.id}" }

  def to_s()
    "Match Id: " + self.id.to_s + ", Date: " + date.to_s
  end

  def settle_predictions_if_over
    if self.finished_changed? && self.finished_was == false
      credit_user_tournament_point_standing
    end
  end

  def credit_user_tournament_point_standing

    if self.round.tournament.tournament_type == TournamentTypes::LOL_WORLD_CUP
      credit_according_to_LWC
    end

  end

  def credit_according_to_LWC

    tourn_type = TournamentTypes::LOL_WORLD_CUP

    # because of UserMatchPrediction validation we know only valid
    # predictions sould exist in the db. So this is straightforward

    user_match_predictions = UserMatchPrediction.where(match: self)

    user_match_predictions.each do |ump|

      # only deal with winner right now. will need all the other ones
      # later too
      if ump.prediction_type == PredictionTypes::WINNER
        credit_winner_prediction_according_to_LWC(ump, tourn_type)
      end

    end

  end

  def credit_winner_prediction_according_to_LWC(ump, tourn_type)
    winner = nil
    if self.results["receiving_contestant"]["winner"] == true
      winner = self.receiving_contestant
    else
      winner = self.invited_contestant
    end

    if ump.predicted_contestant == winner

      uts = UserTournamentScore.find_by(user: ump.user,
        tournament: ump.match.round.tournament)

      points_to_add = PredictionTypes::INFO[tourn_type][
                      ump.prediction_type]["points"]
      multiplier = RoundTypes::INFO[tourn_type][
                      self.round.round_type]["point_multiplier"]
      uts.score += (points_to_add * multiplier)
      uts.save

    end
  end

end




