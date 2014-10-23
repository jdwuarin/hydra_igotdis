ActiveAdmin.register PlayerPosition do

  permit_params :name, :game_id

  index do
    id_column
    column :name
    column :game do |player_position|
      Games::INFO[player_position.game_id]["name"]
    end
    actions
  end


  form do |f|

    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :name
      f.input :game_id, :as => :select, :collection => Games::NAMES
    end
    f.actions
  end
end