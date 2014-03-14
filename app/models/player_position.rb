class PlayerPosition < ActiveRecord::Base

	belongs_to :game
	has_many :players

	validates :name, presence: true
	validates :game_id, presence: true
	validates_presence_of :game
end
