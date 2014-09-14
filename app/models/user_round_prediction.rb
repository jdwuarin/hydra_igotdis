# this test is used right now for the LOL tournament. But ew 
class RoundTypeNot1 < ActiveModel::Validator
  def validate(record)
    if record.round.round_type == 1 and record.predicted_contestant != nil
      tournament.errors[:type] << 'cannot do an actual prediction on this round'
    end
  end
end



class UserRoundPrediction < ActiveRecord::Base

  belongs_to :user
  belongs_to :round
  belongs_to :predicted_contestant, polymorphic: true
  has_many :user_match_predictions

  validates :round, presence: true
  validates :user_id, presence: true
  validates :prediction_type, presence: true
  validates_presence_of :game

  validates_with PredictionHasAppropriatePredictionType
  validates_with RoundTypeNot1

  def to_s
    "User: " + self.user.email +
    " predicted: " + self.predicted_contestant_id +
    " of type: " + self.prediction_type +
    + "On match: " + self.match.name
  end

end
