ActiveAdmin.register Tournament do

  permit_params :name, :tournament_type, :venue_id, :continent_id,
    :game_id, :start_date, :end_date, :description,
    :special_mention, :has_groups, :group_count,
    :group_naming_convention, :image,
    tournament_contestants_attributes: [:id, :tournament_id,
                                        :contestant_type, :contestant_id,
                                        :group_id, :_destroy]

  index do
    id_column
    column :name
    column :game do |tournament|
      Games::INFO[tournament.game_id]["name"]
    end
    column :tournament_type do |tournament|
      TournamentTypes::INFO[tournament.tournament_type]["name"]
    end
    column :venue
    column :continent do |tournament|
      Continents::INFO[tournament.continent_id]["name"]
    end
    column :start_date
    column :end_date
    column :has_groups
    actions
  end


  form :html => { :enctype => "multipart/form-data" } do |f|

    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :name
      f.input :tournament_type,
              :as => :select, :collection => TournamentTypes::NAMES
      f.input :venue, :as => :select, :collection => Venue.all.order(:name)
      f.input :continent_id, :as => :select, :collection => Continents::NAMES
      f.input :game_id, :as => :select, :collection => Games::NAMES
      f.input :description
      f.input :special_mention
      f.input :has_groups
      f.input :group_count
      f.input :group_naming_convention,
              :as => :select, :collection => GroupNamingConventions::NAMES
      f.input :start_date
      f.input :end_date
      f.input :image, :as => :file,
              :hint => f.template.image_tag(f.object.image.url(:medium))
    end

    type_collection = [Player.name, Team.name]
    f.inputs do
      f.has_many :tournament_contestants,
                 :allow_destroy => true do |tc|

        tc.input :contestant_type,
          :as => :select, :collection => type_collection
        tc.input :contestant_id,
          :as => :select, :collection => (Player.all.order(:username) + Team.all.order(:name)).map{|t| ["#{t.to_s}", t.id]}
        tc.input :group_id,
          :as => :select, :collection => Groups::NAMES

      end
    end

    f.actions
  end
end