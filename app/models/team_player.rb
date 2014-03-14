class TeamPlayer < ActiveRecord::Base

	belongs_to :TeamPlayer
	belongs_to :Player

	validates :team_id, presence: true
	validates :player_id, presence: true
	validates_presence_of :team
	validates_presence_of :player
end
