class Player < ActiveRecord::Base

	has_one :team_player
	has_one :team through: teamp_player
	belongs_to :player_position
	belongs_to :game
	belongs_to :continent
	has_many :match_results, as: :contestant
	# many bets can be made on a single player (Starcraft only at time of writing)
	# and the player is referenced in the bet model as winner
	has_many :bets, as: :winner 
end
