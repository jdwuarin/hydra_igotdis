class Team < ActiveRecord::Base

	belongs_to :game
	belongs_to :continent
	has_many :team_players
	has_many :players, through: :team_players
	has_many :match_results, as: :contestant
	has_many :bets, as: :winner

	validates :name, presence: true
	validates :continent_id, presence: true
	validates :game_id, presence: true
	validates :continent, presence: true
	validates :game, presence: true
end
