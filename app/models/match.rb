class Match < ActiveRecord::Base

	has_many :match_results
	has_many :bets
	belongs_to :tournaments

	validates :tournament_id, presence: true
	validates :tournament, presence: true
end
