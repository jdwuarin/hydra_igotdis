class StartsBeforeEnds < ActiveModel::Validator
  def validate(tournament)
    if tournament.end_date != nil
      if tournament.start_date > tournament.end_date
        tournament.errors[:base] << 'tournament cannot start after it ends'
      end
    end
  end
end


class Tournament < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :venue
  has_many :matches

  validates :name, presence: true
  validates :game_id, presence: true
  validates :venue, presence: true
  validates :start_date, presence: :true
  validates_presence_of :venue

  validates_with DatesAreValid
end
