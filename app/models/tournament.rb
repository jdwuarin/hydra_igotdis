class Tournament < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :venue
  has_many :matches

  validates :name, presence: true
  validates :start_date, presence: :true
  validates :tournament_type, presence: :true

  validates_with DatesAreValid
end
