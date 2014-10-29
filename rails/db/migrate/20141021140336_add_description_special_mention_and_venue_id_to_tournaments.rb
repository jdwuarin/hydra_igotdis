class AddDescriptionSpecialMentionAndVenueIdToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :description, :text
    add_column :tournaments, :special_mention, :string
    add_column :tournaments, :venue_id, :integer
  end
end
