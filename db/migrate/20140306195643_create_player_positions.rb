class CreatePlayerPositions < ActiveRecord::Migration
  def change
    create_table :player_positions do |t|
      t.string :name
      t.integer :game

      t.timestamps
    end
  end
end
