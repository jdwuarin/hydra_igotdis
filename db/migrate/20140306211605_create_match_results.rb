class CreateMatchResults < ActiveRecord::Migration
  def change
    create_table :match_results do |t|
      t.integer :match_id
      t.references :contestant, polymorphic: true
      t.references :oponent, polymorphic: true
      t.boolean :winner
      t.integer :kills
      t.integer :num_tower_destroyed

      t.timestamps
    end
  end
end
