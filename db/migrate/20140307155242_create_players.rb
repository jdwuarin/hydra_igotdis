class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.integer :player_position
      t.date :date_of_birth
      t.integer :continent
      t.integer :game_id

      t.timestamps
    end
  end
end
