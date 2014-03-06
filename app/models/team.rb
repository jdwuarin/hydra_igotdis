class Team < ActiveRecord::Base

	belongs_to :game
	belongs_to :continent
	has_many :team_players
	has_many :players, through: :team_players
	has_many :match_results, as: :contestant
end
