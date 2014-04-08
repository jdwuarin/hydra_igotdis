ActiveAdmin.register Match do
  menu parent: "Tournaments"

  permit_params :tournament_id, :date

  index do
    id_column
    column :tournament
    column :date
    default_actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :tournament_id, :as => :select, :collection => Tournament.all
      f.input :date
    end

    type_collection = [Player.name, Team.name]
    f.inputs do
      f.has_many :match_results, MatchResult.new, :new_record => true do |match_result|
        match_result.input :contestant_type, :as => :select, :collection => type_collection
        match_result.input :contestant_id, :as => :select, :collection => Player.all + Team.all
        match_result.input :oponent_type, :as => :select, :collection => type_collection
        match_result.input :oponent_id, :as => :select, :collection => Player.all + Team.all
        match_result.input :winner
        match_result.input :kills
        match_result.input :num_tower_destroyed

      end
    end
  f.actions
  end

end