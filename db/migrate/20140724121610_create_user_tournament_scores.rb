class CreateUserTournamentScores < ActiveRecord::Migration
  def change
    create_table :user_tournament_scores do |t|
      t.references :user
      t.references :tournament
      t.integer :score, :default => 0

      t.timestamps
    end

    add_index :user_tournament_scores,
              [:user_id, :tournament_id], :unique => true
  end
end
