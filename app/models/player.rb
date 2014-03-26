class Player < ActiveRecord::Base

	has_one :team_player
	has_one :team, through: :team_player
	belongs_to :player_position
	belongs_to :game
	belongs_to :continent
	has_many :match_results, as: :contestant
	# many bets can be made on a single player (Starcraft only at time of writing)
	# and the player is referenced in the bet model as winner
	has_many :bets, as: :winner

	validates :user_name, presence: true
	validates :game_id, presence: true
	validates_presence_of :game

	def to_s()
		"Player: " + self.user_name + ", Game: " + Game.find(game_id).name
	end
	
end
