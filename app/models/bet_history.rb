class BetHistory < ActiveRecord::Base

	belongs_to :match
	belongs_to :winner, polymorphic: true

	#validation part
	validates :odds, presence: true
	validates :bet_size, presence: true
	validates :match_id, presence: true
	validates :winner_id, presence: true
	validates_presence_of :match #validates the association (i.e make sure foreign key exists)
	validates_presence_of :winner
	validates :filled_size, presence: true #filled size should be implied
	
end
