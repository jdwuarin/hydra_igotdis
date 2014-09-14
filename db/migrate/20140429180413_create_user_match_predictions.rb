class CreateUserMatchPredictions < ActiveRecord::Migration
  def change
    create_table :user_match_predictions do |t|
      t.references  :match
      t.integer  :prediction_type
      t.references  :predicted_contestant, polymorphic: true
      t.references  :user
      t.text :comment
      t.timestamps
    end
  end
end