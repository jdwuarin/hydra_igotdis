ActiveAdmin.register Tournament do

  permit_params :name, :venue_id, :continent_id, 
  :game_id, :start_date, :end_date, :description, :special_mention

  index do
    id_column
    column :name
    column :game
    column :venue
    column :continent
    column :start_date
    column :end_date
    column :description
    actions
  end

end