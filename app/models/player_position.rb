class PlayerPosition < ActiveRecord::Base

  has_many :players

  validates :name, presence: true
  validates :game_id, presence: true

  def to_s
    "Player Position: " + self.name + ", Game: " + games[game_id][0]
  end
end
