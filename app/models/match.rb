class Match < ActiveRecord::Base

	has_many :match_results
	has_many :bets
	belongs_to :tournament

	validates :tournament_id, presence: true
	validates_presence_of :tournament
end
