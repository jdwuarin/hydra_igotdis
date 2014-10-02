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

  before_save :create_user_tournament_score

  def to_s
    "User: " + self.user.username +
    " predicted: " + self.predicted_contestant +
    " would: " + PREDICTION_TYPES[self.prediction_type].to_s +
    + "On match: " + self.match.name
  end

  def create_user_tournament_score

    UserTournamentScore.find_or_create_by(
      user: self.user, tournament: self.match.round.tournament)

  end

  def self.find_or_instantiate_by(match_id, prediction_type, user)

    ump = nil

    if prediction_type.to_i == 5 || prediction_type == 6

      ump = UserMatchPrediction.where( 
        :match_id => match_id, :prediction_type => 5, :user => user)

      if ump == []
        ump = UserMatchPrediction.where( 
          :match_id => match_id, :prediction_type => 6, :user => user)

      end

    end

    if prediction_type == 7 || prediction_type == 8 || prediction_type == 9

      ump = UserMatchPrediction.where( 
        :match_id => match_id, :prediction_type => 7, :user => user)

      if ump == []
        ump = UserMatchPrediction.where( 
          :match_id => match_id, :prediction_type => 8, :user => user)

      end

      if ump == []
        ump = UserMatchPrediction.where( 
          :match_id => match_id, :prediction_type => 9, :user => user)

      end

    end

    if ump == nil || ump == []

      ump = UserMatchPrediction.find_or_initialize_by(
        :match_id => match_id,
        :prediction_type => prediction_type,
        :user => user
      )

    else
      ump = ump[0]
    end

  return ump

  end



end
