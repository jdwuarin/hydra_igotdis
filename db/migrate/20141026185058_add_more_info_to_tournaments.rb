class AddMoreInfoToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :tournament_url, :string
    add_column :tournaments, :prize_pool, :decimal
  end
end
