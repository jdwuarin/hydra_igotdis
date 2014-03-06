class MatchResult < ActiveRecord::Base

	belongs_to :match
	belongs_to :contestant, polymorphic: true
	has_one :tournament, through: :match
	belongs_to :oponent, polymorphic: true #should be of the same class as the contestant
end
