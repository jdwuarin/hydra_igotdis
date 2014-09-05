ActiveAdmin.register Team do

  permit_params :name, :continent_id, 
                :game_id, :match_result

  index do
    id_column
    column :name
    column :game
    column :continent
    default_actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :name
      f.input :game, :as => :select, :collection => games
      f.input :continent, :as => :select, :collection => Continent.all.order(:name)
    end

    f.inputs do
      f.has_many :players, through: :team_players do |player|
        player.input :username
        player.input :first_name
        player.input :last_name
        player.input :player_position, :as => :select, :collection => PlayerPosition.all
        player.input :game, :as => :select, :collection => Game.all.order(:name)
        player.input :continent, :as => :select, :collection => Continent.all.order(:name)
      end
    end

    # f.inputs do
    #   f.has_many :team_players do |team_player|
    #     puts "meee"
    #   end
    # end
    # f.inputs do
    #   f.has_many :team_players do |team_player|
    #     #team_player.input
    #   end
      # f.has_many :match_results do |match_result|
      #   match_result.input :contestant_type, :as => :select, :collection => type_collection
      #   match_result.input :contestant_id, :as => :select, :collection => Player.all + Team.all
      #   match_result.input :oponent_type, :as => :select, :collection => type_collection
      #   match_result.input :oponent_id, :as => :select, :collection => Player.all + Team.all
      #   match_result.input :winner
      #   match_result.input :kills
      #   match_result.input :num_tower_destroyed

      # end
    #end

    f.actions
  end
end