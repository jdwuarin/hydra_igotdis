class CreateUserMatchPredictions < ActiveRecord::Migration
  def change
    create_table :user_match_predictions do |t|
      t.references :match
      t.integer :prediction_type
      t.references :predicted_contestant
      t.references :user
      t.text :comment
      t.timestamps
    end

    # users can only do one prediction of a certain type per match
    add_index :user_match_predictions,
              [:match_id, :user_id, :prediction_type], 
              :unique => true,
              :name => "index_ump_on_match_and_user_and_prediction_type"

  end
end