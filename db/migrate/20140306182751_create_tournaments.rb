class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.timestamp :start_date
      t.timestamp :end_date
      t.integer :continent_id
      t.integer :tournament_type
      t.integer :game_id
      t.boolean :has_groups
      t.integer :group_count
      t.integer :group_naming_convention

      t.timestamps
    end
  end
end
