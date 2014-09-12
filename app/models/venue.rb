class Venue < ActiveRecord::Base

  has_many :tournaments
  
  validates :name, uniqueness: true, presence: true
end
