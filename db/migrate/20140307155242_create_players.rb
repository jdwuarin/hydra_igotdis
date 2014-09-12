class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.references :player_position
      t.date :date_of_birth
      t.integer :continent_id
      t.integer :game_id

      t.timestamps

    end

    # Add index to players Username And GameId combination. must be unique 
    add_index :players, [:username, :game_id], :unique => true
  end
end