ActiveAdmin.register Team do

  permit_params :name, :continent_id,
                :game_id, :description, :logo,
                team_players_attributes: [:id, :team_id,
                                          :player_id, :_destroy]

  index do
    id_column
    column :name
    column :continent do |team|
      Continents::INFO[team.continent_id]["name"]
    end
    column :game do |team|
      Games::INFO[team.game_id]["name"]
    end
    actions
  end


  form :html => { :enctype => "multipart/form-data" } do |f|

    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :name
      f.input :continent_id, :as => :select, :collection => Continents::NAMES
      f.input :game_id, :as => :select, :collection => Games::NAMES
      f.input :description
      f.input :logo, :as => :file,
              :hint => f.template.image_tag(f.object.logo.url(:medium))
    end

    f.inputs do
      f.has_many :team_players,
                 :allow_destroy => true do |tp|

        tp.input :player_id,
          :as => :select, :collection => Player.all.order(:username).map{|t| ["#{t.to_s}", t.id]}

      end
    end

    f.actions
  end
end