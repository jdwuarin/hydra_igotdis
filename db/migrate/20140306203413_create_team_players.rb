class CreateTeamPlayers < ActiveRecord::Migration
  def change
    create_table :team_players do |t|
      t.references :team
      t.references :player

      t.timestamps
    end
  end
end
