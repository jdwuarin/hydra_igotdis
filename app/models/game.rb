class Game < ActiveRecord::Base

  has_many :tournaments
  has_many :teams

  validates :name, presence: true
  validates_inclusion_of :is_team_game, :in => [true, false]


  def to_s
    "Game: " + self.name + "Team Game: " + self.is_team_game
  end
end
