class Game < ActiveRecord::Base

	has_many :tournaments
	has_many :teams

end
