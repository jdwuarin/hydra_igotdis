class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.integer :player_position_id
      t.date :date_of_birth
      t.integer :continent_id
      t.integer :game_id

      t.timestamps
    end
  end
end