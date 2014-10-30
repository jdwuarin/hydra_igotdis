class AddInGameIdWhereNeeded < ActiveRecord::Migration
  def change
    # for players
    add_column :players, :in_game_id, :integer
    add_column :teams, :in_game_id, :integer
    add_column :matches, :game_id, :integer
    add_column :matches, :in_game_id, :integer
    add_column :characters, :in_game_id, :integer
    add_column :tournaments, :in_game_id, :integer

    add_index :players,
              [:in_game_id, :game_id], :unique => true
    add_index :teams,
              [:in_game_id, :game_id], :unique => true
    add_index :matches,
              [:in_game_id, :game_id], :unique => true
    add_index :characters,
              [:in_game_id, :game_id], :unique => true
    add_index :tournaments,
              [:in_game_id, :game_id], :unique => true
  end
end
