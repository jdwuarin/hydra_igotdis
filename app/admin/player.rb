ActiveAdmin.register Player do

  permit_params :username, :first_name, :last_name, :player_position_id,
  :game_id, :date_of_birth, :continent_id, :description, :avatar

  index do
    id_column
    column :username
    column :first_name
    column :last_name
    column :player_position
    column :date_of_birth
    column :continent do |player|
      if player.continent_id
        Continents::INFO[player.continent_id]["name"]
      end
    end
    column :game do |player|
      Games::INFO[player.game_id]["name"]
    end
    actions
  end


  form :html => { :enctype => "multipart/form-data" } do |f|

    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :avatar, :as => :file,
              :hint => f.template.image_tag(f.object.avatar.url(:medium))
      f.input :username
      f.input :first_name
      f.input :last_name
      f.input :game_id, :as => :select, :collection => Games::NAMES
      f.input :player_position,
              :as => :select,
              :collection => PlayerPosition.all.map{|u| ["#{u.to_s}", u.id]}
      f.input :date_of_birth, :as => :date_picker
      f.input :continent_id, :as => :select, :collection => Continents::NAMES
      f.input :description
    end
    f.actions
  end
end