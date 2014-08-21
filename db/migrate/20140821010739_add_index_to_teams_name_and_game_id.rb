class AddIndexToTeamsNameAndGameId < ActiveRecord::Migration
  def change
    add_index :teams, [:name, :game_id], :unique => true
  end
end
