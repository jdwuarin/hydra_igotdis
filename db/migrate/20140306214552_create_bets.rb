class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :match_id
      t.references :winner, polymorphic: true
      t.decimal :odds
      t.decimal :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
