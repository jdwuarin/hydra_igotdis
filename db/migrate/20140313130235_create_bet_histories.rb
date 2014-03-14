class CreateBetHistories < ActiveRecord::Migration
  def change
    create_table :bet_histories do |t|
      t.integer :match_id
      t.references :winner, polymorphic: true
      t.decimal :odds
      t.integer :user_id
      t.decimal :bet_size
      t.decimal :filled_size

      t.timestamps
    end
  end
end
