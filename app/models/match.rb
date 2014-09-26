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

end




