class AddBetSizesToBets < ActiveRecord::Migration
  def change
    add_column :bets, :bet_size, :decimal
    add_column :bets, :filled_size, :decimal # how much of the bet size is filled right now
  end
end
