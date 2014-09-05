class Prediction < ActiveRecord::Base

  belongs_to :match
  belongs_to :user
  belongs_to :predicted_contestant, polymorphic: true
  belongs_to :user_round_predictions

  validates :match_id, presence: true
  validates :user_id, presence: true
  validates :prediction_type, presence: true
  validates :predicted_contestant_id, presence: true
  validates_presence_of :game

  validates_with PredictionHasAppropriatePredictionType

  def to_s
    "User: " + self.user.email +
    " predicted: " + self.predicted_contestant_id +
    " of type: " + self.prediction_type +
    + "On match: " + self.match.name
  end

end
