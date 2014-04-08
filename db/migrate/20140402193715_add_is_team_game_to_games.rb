class AddIsTeamGameToGames < ActiveRecord::Migration
  def change
    add_column :games, :is_team_game, :boolean
  end
end
