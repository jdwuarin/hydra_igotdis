class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :continent_id
      t.integer :game_id

      t.timestamps
    end

    # Add Index ToTeams NameAndGameId combination. must be unique
    add_index :teams, [:name, :game_id], :unique => true
  end
end
