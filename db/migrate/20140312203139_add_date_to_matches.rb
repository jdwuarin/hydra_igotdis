class AddDateToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :date, :timestamp
  end
end
