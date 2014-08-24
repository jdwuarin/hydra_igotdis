class Prediction < ActiveRecord::Base

  belongs_to :match
  belongs_to :user

  belongs_to :player_position

  validates :match_id, presence: true
  validates :user_id, presence: true
  validates :prediction_type, presence: true
  validates :predicted_contestant_id, presence: true
  validates_presence_of :game

  def to_s
    "User: " + self.user.email +
    " predicted: " + self.predicted_contestant_id +
    " of type: " + self.prediction_type +
    + "On match: " + self.match.name
  end

end
