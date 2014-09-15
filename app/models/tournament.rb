class Tournament < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :venue
  has_many :matches

  validates :name, presence: true
  validates :game_id, presence: true
  validates :venue, presence: true
  validates :start_date, presence: :true
  validates :tournament_type, presence: :true
  validates_presence_of :venue

  validates_with DatesAreValid
end
