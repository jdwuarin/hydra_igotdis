class TeamPlayer < ActiveRecord::Base

  belongs_to :team
  belongs_to :player

  validates :team_id, presence: true
  validates :player_id, presence: true
  validates_presence_of :team
  validates_presence_of :player

  validate :team_game_same_as_player_game

  def team_game_same_as_player_game
    return unless errors.blank?

    unless team.game_id == player.game_id
      errors[:type] << "team game and player game must be identical"
    end
  end


end
