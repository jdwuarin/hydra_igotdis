class UserMatchPrediction < ActiveRecord::Base

  belongs_to :match
  belongs_to :user
  belongs_to :predicted_contestant, class_name: 'TournamentContestant'

  validates :match_id, presence: true
  validates :user_id, presence: true
  validates :prediction_type, presence: true
  validates :prediction_type, presence: true
  validates :predicted_contestant, presence: true
  validates :match, :user, :prediction_type,
            :uniqueness => {:scope => [:match, :user, :prediction_type]}

  validates_with PredictionHasAppropriatePredictionType
  validates_with PredictedContestantParticipated

  def to_s
    "User: " + self.user.email +
    " predicted: " + self.predicted_contestant +
    " to achieve: " + Enums::PREDICTION_TYPES[self.prediction_type][0] +
    + "On match: " + self.match.name
  end

  # def find_or_build_by(search_params)
  #   # first try finding 
  #   UserMatchPrediction

end
