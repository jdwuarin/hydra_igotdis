class ChangeBetsOddsFormatToString < ActiveRecord::Migration
  def change
    change_column :bets, :odds, :string
  end
end
