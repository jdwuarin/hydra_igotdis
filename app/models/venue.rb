class Venue < ActiveRecord::Base

  has_many :tournaments
  
  validates :name, uniqueness: true, presence: true

  def to_s
    "Venue: " + self.name
  end

end
