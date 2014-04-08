class RenameColumnPlayerPositionToPlayerPositionIdFromPlayers < ActiveRecord::Migration
  def change
    rename_column :players, :player_position, :player_position_id
  end
end
