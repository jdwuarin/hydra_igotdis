class PlayerPosition < ActiveRecord::Base

  has_many :players

  validates :name, presence: true
  validates :game_id, presence: true

  def to_s
    Games::INFO[self.game_id]["name"] + " " + self.name
  end
end
