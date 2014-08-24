class Player < ActiveRecord::Base

  has_one :team_player, dependent => :destroy
  has_one :team, through: :team_player
  belongs_to :player_position
  has_many :matches_as_receiving_contestant, :as => receiving_contestant, :class_name => 'Match'
  has_many :matches_as_invited_contestant, :as => invited_contestant, :class_name => 'Match'
  # many bets can be made on a single player (Starcraft only at time of writing)
  # and the player is referenced in the bet model as winner
  has_many :predictions, as: :predicted_contestant

  validates :user_name, presence: true
  validates :player_position_id, presence: true
  validates_presence_of :player_position
  validates :game_id, presence: true
  validates_presence_of :game

  validates_with UniqueTeamNamePerGame

  def to_s
    "Player: " + self.user_name + ", Game: " + Game.find(game_id).name
  end
  
end
