ActiveAdmin.register Tournament do

  permit_params :name, :tournament_type, :venue_id, :continent_id,
  :game_id, :start_date, :end_date, :description,
  :special_mention, :has_groups, :group_count,
  :group_naming_convention, :image

  index do
    id_column
    column :name
    column :game_id
    column :tournament_type do |tournament_type|
      TournamentTypes::BLUB[tournament_type]
    end
    column :venue
    column :continent_id
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
    f.actions
  end
end