ActiveAdmin.register Team do

  permit_params :name, :continent_id, :game_id

  index do
  	id_column
  	column :name
  	column :game
  	column :continent
  	default_actions
  end

end