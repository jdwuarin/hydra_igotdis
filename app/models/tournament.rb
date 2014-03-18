class StartsBeforeEnds < ActiveModel::Validator
  def validate(tournament)
  	if tournament.start_date != nil and tournament.end_date != nil and tournament.start_date > tournament.end_date
      tournament.errors[:base] << 'tournament cannot start after it ends'
    end
  end
end


class Tournament < ActiveRecord::Base
	include ActiveModel::Validations

	belongs_to :game
	belongs_to :venue
	belongs_to :continent
	has_many :matches

	validates :name, presence: true
	validates :game_id, presence: true
	validates :venue_id, presence: true
	validates :continent_id, presence: true
	validates_presence_of :game
	validates_presence_of :venue
	validates_presence_of :continent

	validates_with StartsBeforeEnds
end
