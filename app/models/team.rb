class UniqueTeamNamePerGame < ActiveModel::Validator
  def validate(record)
    if !Team.where(name: record.name, game_id: record.game_id).empty?
      record.errors[:name] << 'Team with the name ' +
                              record.name + 
                              ' already exists for game ' + 
                              record.game_id.to_s
    end
  end
end

class Team < ActiveRecord::Base

  has_many :team_players, :dependent => :destroy
  has_many :players, through: :team_players
  has_many :rounds_as_receiving_contestant, :as => :receiving_contestant, :class_name => 'Round'
  has_many :rounds_as_invited_contestant, :as => :invited_contestant, :class_name => 'Round'
  has_many :matches_as_receiving_contestant, :as => :receiving_contestant, :class_name => 'Match'
  has_many :matches_as_invited_contestant, :as => :invited_contestant, :class_name => 'Match'
  has_many :predictions, as: :predicted_contestant

  validates :name, presence: true
  validates :continent_id, presence: true
  validates :game_id, presence: true

  validates_with UniqueTeamNamePerGame

  accepts_nested_attributes_for :team_players
  accepts_nested_attributes_for :players

  before_destroy :destroy_team_players

  def to_s()
    "Team: " + self.name + ", Game: " + games[game_id][0]
  end

end