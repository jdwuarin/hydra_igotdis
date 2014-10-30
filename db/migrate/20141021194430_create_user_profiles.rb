class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|

      t.references :user
      t.integer    :game_id
      t.integer    :points
      t.integer    :title
      t.string     :status

      t.timestamps
    end
    add_index :user_profiles,
              [:user_id, :game_id], :unique => true
  end
end
