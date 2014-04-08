class Venue < ActiveRecord::Base

  has_many :tournaments
  
  validates :name, presence: true
end
