class RemoveAmountFromBets < ActiveRecord::Migration
  def change
    remove_column :bets, :amount, :string
  end
end
