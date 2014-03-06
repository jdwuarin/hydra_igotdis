class Player < ActiveRecord::Base

	has_one :team_player
	has_one :team through: teamp_player
	belongs_to :player_position
	belongs_to :game
	belongs_to :continent
	has_many :match_results, as: :contestant
end
