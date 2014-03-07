class PlayerPosition < ActiveRecord::Base

	belongs_to :game
	has_many :players

	validates :name, presence: true
	validates :game_is, presence: true
	validates :game, presence: true
end
