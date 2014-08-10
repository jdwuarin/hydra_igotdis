class CreateUserEventPointStandings < ActiveRecord::Migration
  def change
    create_table :user_event_point_standings do |t|
      t.integer :user_id
      t.integer :tournament_id
      t.integer :points

      t.timestamps
    end
  end
end
