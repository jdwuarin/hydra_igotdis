class AddImageAndDescriptionToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :image, :string
    add_column :tournaments, :description, :text
  end
end
