class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :tournament
      t.integer :round_type
      t.integer :points_multiplier
      t.timestamp :start_date
      t.timestamp :end_date
      t.boolean :is_direct_elimination_round, :default => false
      t.boolean :finished, :default => false
      t.references :receiving_contestant, polymorphic: true
      t.references :invited_contestant, polymorphic: true

      t.timestamps
    end
  end
end