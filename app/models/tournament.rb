class Tournament < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :venue
  has_many :tournament_contestants
  has_many :rounds
  has_many :matches, :through => :rounds

  validates :name, presence: true
  validates :start_date, presence: :true
  validates :tournament_type, presence: :true
  validates :game_id, presence: :true
  validates :group_count, :presence => true,
            :if => "!has_groups.blank?"
  validates :group_naming_convention,
            :presence => true, :if => "!has_groups.blank?"

  validates_with DatesAreValid
end
