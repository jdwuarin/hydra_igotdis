class Tournament < ActiveRecord::Base

	belongs_to :game
	belongs_to :venue
	belongs_to :continent
end
