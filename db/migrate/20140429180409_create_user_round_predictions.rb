class CreateUserRoundPredictions < ActiveRecord::Migration
  def change
    create_table :user_round_predictions do |t|
      t.references  :round
      t.integer  :prediction_type
      t.references  :predicted_contestant, polymorphic: true
      t.references  :user
      t.text :comment
      t.timestamps
    end

    # users can only do one prediction per round
    add_index :user_round_predictions, [:round_id, :user_id], :unique => true

  end
end