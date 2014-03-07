class Tournament < ActiveRecord::Base

	belongs_to :game
	belongs_to :venue
	belongs_to :continent

	validates :name, presence: true
	validates :game_id, presence: true
	validates :venue_id, presence: true
	validates :continent_id, presence: true
	validates :game, presence: true
	validates :venue, presence: true
	validates :continent, presence: true
end
