class WinnerParticipatedInMatch < ActiveModel::Validator
	def validate(bet)
		mr = bet.match.match_results
		if mr.length < 2
			bet.errors[:match] << "Could not find any match_results for match"	
		elsif mr[0].contestant != bet.winner && mr[0].oponent != bet.winner
			bet.errors[:winner] << "Winner could not be found in match..."
		end
	end
end

class Bet < ActiveRecord::Base

	belongs_to :match
	belongs_to :winner, polymorphic: true
	belongs_to :user

	#validation part
	validates :odds, presence: true
	validates :bet_size, presence: true
	validates :match_id, presence: true
	validates :winner_id, presence: true
	validates :user_id, presence: true
	validates_presence_of :match #validates the association (i.e make sure foreign key exists)
	validates_presence_of :winner
	validates_presence_of :user
	validates :filled_size, presence: true #filled size should be implied in a before_save block

	validates_with WinnerParticipatedInMatch

end
