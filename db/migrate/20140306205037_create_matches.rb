# although we might not use the receiving and invited
# concepts in the frontend. This helps make the 
# backend clearer
# it is up to the backend to make sure that the :results
# hstore column contains all the necessary information
# in order to settle the points for all the prediction_types

class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :tournament_id
      t.timestamp :date
      t.boolean :finished, :default => false
      t.references :receiving_contestant, polymorphic: true
      t.references :invited_contestant, polymorphic: true
      t.hstore :results

      t.timestamps
    end
  end
end