class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.timestamp :start_date
      t.timestamp :end_date
      t.integer :continent_id
      t.integer :tournament_type # this contains the game_id

      t.timestamps
    end
  end
end
