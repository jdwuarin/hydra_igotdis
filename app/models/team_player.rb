class TeamPlayer < ActiveRecord::Base

	belongs_to :teamPlayer
	belongs_to :player

	validates :team_id, presence: true
	validates :player_id, presence: true
	validates_presence_of :team
	validates_presence_of :player
end
