class UserMatchPrediction < ActiveRecord::Base

  belongs_to :match
  belongs_to :user
  belongs_to :predicted_contestant, class_name: 'TournamentContestant'

  validates :match, presence: true
  validates :user, presence: true
  validates :prediction_type, presence: true
  validates :predicted_contestant, presence: true
  validates :match, :user, :prediction_type,
            :uniqueness => {:scope => [:match, :user, :prediction_type]}

  validates_with PredictionTypeValidator
  validates_with MatchUnstarted
  validates_with PredictedContestantParticipated

  def to_s
    "User: " + self.user.username +
    " predicted: " + self.predicted_contestant +
    " would: " + PREDICTION_TYPES[self.prediction_type].to_s +
    + "On match: " + self.match.name
  end

end
