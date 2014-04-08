class Team < ActiveRecord::Base

  belongs_to :game
  belongs_to :continent
  has_many :team_players
  has_many :players, through: :team_players
  has_many :match_results, as: :contestant
  has_many :bets, as: :winner

  validates :name, presence: true, uniqueness: true
  validates :continent_id, presence: true
  validates :game_id, presence: true
  validates_presence_of :continent
  validates_presence_of :game

  accepts_nested_attributes_for :team_players
  accepts_nested_attributes_for :players

  def to_s()
    "Team: " + self.name + ", Game: " + Game.find(game_id).name
  end

end
