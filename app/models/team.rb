class Team < ActiveRecord::Base

  has_many :tournament_contestants, as: :contestant, :dependent => :destroy
  has_many :team_players, :dependent => :destroy
  has_many :players, through: :team_players

  validates :name, presence: true
  validates :continent_id, presence: true
  validates :game_id, presence: true

  validates :name, :game_id, :uniqueness => {:scope => [:name, :game_id]}

  accepts_nested_attributes_for :team_players
  accepts_nested_attributes_for :players

  def to_s()
    "Team: " + self.name + ", Game: " + games[game_id][0]
  end

end