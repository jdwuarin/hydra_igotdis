class CreateUserRoundPredictions < ActiveRecord::Migration
  def change
    create_table :user_round_predictions do |t|
      t.references  :round
      t.integer  :prediction_type
      t.references  :predicted_contestant, polymorphic: true
      t.references  :user
      t.timestamps
    end
  end
end