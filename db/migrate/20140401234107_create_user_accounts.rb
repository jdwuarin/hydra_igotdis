class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.integer :user_id
      t.decimal :play_money
      t.decimal :money
      t.integer :currency_id

      t.timestamps
    end
  end
end
