class Player < ActiveRecord::Base

  has_many :tournament_contestants
  has_one :team_player, :dependent => :destroy
  has_one :team, through: :team_player
  belongs_to :player_position
  # many bets can be made on a single player (Starcraft only at time of writing)
  # and the player is referenced in the bet model as winner

  validates :username, presence: true
  validates :player_position_id, presence: true
  validates_presence_of :player_position
  validates :game_id, presence: true

  validates :username, :game_id,
            :uniqueness => {:scope => [:username, :game_id]}

  def to_s
    "Player: " + self.username + ", Game: " + Game.find(game_id).name
  end
  
end
