class RenameColumnContinentToContinentIdFromPlayers < ActiveRecord::Migration
  def change
    rename_column :players, :continent, :continent_id
  end
end
