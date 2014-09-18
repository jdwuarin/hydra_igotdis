class UserRoundPrediction < ActiveRecord::Base

  belongs_to :user
  belongs_to :round
  belongs_to :predicted_contestant, class_name: 'TournamentContestant'
  has_many :user_match_predictions

  validates :round, presence: true
  validates :user, presence: true
  validates :prediction_type, presence: true
  validates :predicted_contestant, presence: true
  validates :round, :user, :uniqueness => {:scope => [:round, :user]}

  validates_with PredictionHasAppropriatePredictionType

  def to_s
    "User: " + self.user.email +
    " predicted: " + self.predicted_contestant_id +
    " to achieve: " + Enums::PREDICTION_TYPES[self.prediction_type][0] +
    + "On match: " + self.match.name
  end

end
