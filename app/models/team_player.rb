class TeamPlayer < ActiveRecord::Base

	belongs_to :TeamPlayer
	belongs_to :Player

	validates :team_id, presence: true
	validates :player_id, presence: true
	validates :team, presence: true
	validates :player, presence: true
end
