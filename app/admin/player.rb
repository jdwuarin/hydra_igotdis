ActiveAdmin.register Player do

  permit_params :user_name, 
                :first_name, 
                :last_name,
                :player_position_id,
                :date_of_birth,
                :continent_id,
                :game_id


  index do
    id_column
    column :user_name
    column :first_name
    column :last_name
    column :player_position
    column :date_of_birth
    column :continent
    column :game
    default_actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :user_name
      f.input :first_name
      f.input :last_name
      f.input :player_position, :as => :select, :collection => PlayerPosition.all
      f.input :date_of_birth
      f.input :game, :as => :select, :collection => Game.all.order(:name)
      f.input :continent, :as => :select, :collection => Continent.all.order(:name)
    end
    f.actions
  end
end