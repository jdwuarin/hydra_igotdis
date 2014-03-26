class AddFilledAndFilledMaxToBets < ActiveRecord::Migration
  def change
    add_column :bets, :filled, :boolean
    add_column :bets, :filled_max, :decimal
  end
end
