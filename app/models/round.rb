class Round < ActiveRecord::Base

  belongs_to :tournament
  has_many :matches

  validates :tournament, presence: true
  validates_presence_of :tournament
  validates :round_type, presence: true
  validates :is_direct_elimination_round,
            :inclusion => {:in => [true, false]}
  validates :start_date, presence: true

  validates_with DatesAreValid
  validates_with RoundTypeValidator

  def to_s()
    "Round Id: " + self.id.to_s +
    ", round_type: " + round_types[self.round_type]
  end

end



