  # ActiveAdmin.register MatchResult do
  #   menu parent: "Tournaments"

  #   permit_params :match_id, :contestant_type,
  #                 :contestant_id, :oponent_id,
  #                 :oponent_type, :winner, :kills
  #                 :num_tower_destroyed

  #   # actions :all, except: [:destroy] # have to destroy match to destroy match_results
  #   index do
  #     id_column
  #     column :match
  #     column :contestant_type
  #     column :contestant
  #     column :oponent
  #     column :winner
  #     column :kills
  #     column :num_tower_destroyed
  #     actions
  #   end

  #   type_collection = [Player.name, Team.name]

  #   form do |f|
  #     f.semantic_errors *f.object.errors.keys

  #     f.inputs 'Details' do
  #       f.input :match_id, :as => :select, :collection => Match.all
  #       f.input :contestant_type, :as => :select, :collection => type_collection
  #       f.input :contestant_id, :as => :select, :collection => Player.all + Team.all
  #       f.input :oponent_type, :as => :select, :collection => type_collection
  #       f.input :oponent_id, :as => :select, :collection => Player.all + Team.all
  #       f.input :kills
  #       f.input :winner
  #       f.input :num_tower_destroyed
  #     end
  #     f.actions
  #   end
  # end