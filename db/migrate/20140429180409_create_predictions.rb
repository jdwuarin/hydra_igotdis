class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer  :match_id
      t.integer  :prediction_type
      t.string   :predicted_contestant_type
      t.integer  :predicted_contestant_id
      t.integer  :user_id
      t.timestamps
    end
  end
end