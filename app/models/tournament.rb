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


  has_attached_file :image, :styles => { :large => "1024x768>",
                                         :medium => "640x480>",
                                         :thumb => "120x90>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates_with DatesAreValid
end
