class CreateTournamentContestant < ActiveRecord::Migration
  def change
    create_table :tournament_contestants do |t|
      t.references :tournament
      t.references :contestant, polymorphic: true
      t.integer :group_id

      t.timestamps

    end

    add_index :tournament_contestants, 
             [:tournament_id, :contestant_id], :unique => true
  end
end