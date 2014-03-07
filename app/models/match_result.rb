class MatchResult < ActiveRecord::Base

	belongs_to :match
	belongs_to :contestant, polymorphic: true
	has_one :tournament, through: :match
	belongs_to :oponent, polymorphic: true #should be of the same class as the contestant

	validates :match_id, presence: true
	validates :contestant_id, presence: true
	validates :oponent_id, presence: true
	validates :match, presence: true
	validates :contestant, presence: true
	validates :oponent, presence: true
end
