class Match < ActiveRecord::Base

	has_many :match_results
	has_many :bets
end
