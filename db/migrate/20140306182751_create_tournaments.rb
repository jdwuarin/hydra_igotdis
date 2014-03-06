class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :game_id
      t.timestamp :start_date
      t.timestamp :end_date
      t.integer :venue_id
      t.integer :continent_id

      t.timestamps
    end
  end
end
