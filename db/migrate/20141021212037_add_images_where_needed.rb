class AddImagesWhereNeeded < ActiveRecord::Migration
  def change
    # for players
    remove_column :players, :avatar, :string
    add_attachment :players, :avatar

    # for teams
    remove_column :teams, :logo, :string
    add_attachment :teams, :logo

    add_attachment :tournaments, :image
    add_attachment :user_profiles, :avatar
    add_attachment :matches, :image
    add_attachment :characters, :avatar
  end
end
