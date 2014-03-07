class Bet < ActiveRecord::Base

	belongs_to :match
	belongs_to :winner, polymorphic: true

	#validation part
	validates :odds, presence: true
	validates :bet_size, presence: true
	validates :filled_size, presence: true
	validates :match_id, presence: true
	validates :winner_id, presence: true
	validates :match, presence: true #validates the association (i.e make sure foreign key exists)
	validates :winner, presence: true
	
end
