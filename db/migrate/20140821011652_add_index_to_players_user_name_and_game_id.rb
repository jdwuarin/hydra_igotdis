class AddIndexToPlayersUserNameAndGameId < ActiveRecord::Migration
  def change
    add_index :players, [:user_name, :game_id], :unique => true
  end
end
