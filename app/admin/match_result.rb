ActiveAdmin.register MatchResult do
	menu parent: "Tournaments"

  permit_params :match_id, :contestant_id, :oponent_id, :winner, :kills
  							:num_tower_destryed

  index do
    id_column
    column :match
    column :contestant_id
    column :oponent_id
    column :winner
    column :kills
    column :num_tower_destryed
    default_actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :match
      f.input :contestant_type
      f.input :contestant_id
      f.input :oponent_type
      f.input :oponent_id
    end
    f.actions
  end
end