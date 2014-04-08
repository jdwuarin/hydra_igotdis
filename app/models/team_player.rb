class TeamPlayer < ActiveRecord::Base

  belongs_to :team
  belongs_to :player

  validates :team_id, presence: true
  validates :player_id, presence: true
  validates_presence_of :team
  validates_presence_of :player

  accepts_nested_attributes_for :player
end
