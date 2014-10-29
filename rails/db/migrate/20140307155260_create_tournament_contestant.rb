class CreateTournamentContestant < ActiveRecord::Migration
  def change
    create_table :tournament_contestants do |t|
      t.references :tournament
      t.references :contestant, polymorphic: true
      t.integer :group_id

      t.timestamps

    end

    add_index :tournament_contestants, 
             [:tournament_id, :contestant_id, :contestant_type], 
             :unique => true,
             :name => "index_tc_on_tournament_and_contestant"
  end
end