class Match < ActiveRecord::Base

	has_many :match_results
	has_many :bets
	belongs_to :tournament

	validates :tournament_id, presence: true
	validates_presence_of :tournament

	accepts_nested_attributes_for :match_results

	# make sure all match results are destroyed when a match is destroyed
	before_destroy { |match| MatchResult.destroy_all "match_id = #{match.id}" }

	def to_s()
		"Match Id: " + self.id.to_s + ", Date: " + date.to_s
	end

end
