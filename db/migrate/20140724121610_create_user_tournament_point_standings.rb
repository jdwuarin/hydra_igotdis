class CreateUserTournamentPointStandings < ActiveRecord::Migration
  def change
    create_table :user_event_point_standings do |t|
      t.references :user
      t.references :tournament
      t.integer :points, :default => 0

      t.timestamps
    end
  end
end
