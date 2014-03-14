class Tournament < ActiveRecord::Base

	belongs_to :game
	belongs_to :venue
	belongs_to :continent
	has_many :matches

	validates :name, presence: true
	validates :game_id, presence: true
	validates :venue_id, presence: true
	validates :continent_id, presence: true
	validates_presence_of :game
	validates_presence_of :venue
	validates_presence_of :continent
end
