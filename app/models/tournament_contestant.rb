class TournamentContestant < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :tournament
  belongs_to :contestant, polymorphic: true
  belongs_to :team, -> { where(tournament_contestants:
                         {contestant_type: 'Team'}) },
                         foreign_key: 'contestant_id'
  belongs_to :player, -> { where(tournament_contestants:
                           {contestant_type: 'Player'}) },
                           foreign_key: 'contestant_id'
  # has many predictions and is referred to as predicted_contestant
  # in model referencing it
  has_many :user_match_predictions, as: :predicted_contestant

  has_many :matches_as_receiving_contestant,
           :as => :receiving_contestant, :class_name => 'Match'

  has_many :matches_as_invited_contestant,
           :as => :invited_contestant, :class_name => 'Match'

  validates :tournament_id, :contestant_id, :contestant_type, :uniqueness =>
            {:scope => [:tournament_id, :contestant_id, :contestant_type]}

  validate :contestant_type_and_game_type_validations

  def contestant_type_and_game_type_validations
    return unless errors.blank?

    cond_1 = Games::INFO[tournament.game_id]["team_game"]
    cond_2 = contestant_type == Player.name
    cond_3 = contestant_type == Team.name
    if cond_1 && cond_2 || !cond_1 && cond_3
      errors[:type] << "team games require team contestants and vice versa"
    end

    unless tournament.game_id == contestant.game_id
      errors[:type] << "tournament game must be the same as contestant game"
    end
  end


  def to_s()

    "Tournament: " + self.tournament.name +
    ", contestant_type: " + self.contestant_type +
    if self.contestant_type == Player
      ", contestant_type: " + self.contestant.username
    else
      ", contestant_type: " + self.contestant.name
    end

  end


end