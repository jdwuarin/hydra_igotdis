class AddIndexToPlayersUserNameAndGameId < ActiveRecord::Migration
  def change
    add_index :players, [:username, :game_id], :unique => true
  end
end
