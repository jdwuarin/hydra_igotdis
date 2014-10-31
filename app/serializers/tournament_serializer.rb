class TournamentSerializer < ActiveModel::Serializer

  attributes :id, :name, :start_date, :end_date,
             :continent, :tournament_type, :game,
             :has_groups, :group_count, :group_naming_convention,
             :special_mention, :venue


  delegate :request, :to => :scope

  def attributes
    full_cond = !(request.path.include? "tournaments")
    data = super
    data[:description] = object.description if full_cond
    data[:image] = image if full_cond
    data
  end


  def continent
    Continents::INFO[object.continent_id]["name"]
  end

  def game
    Games::INFO[object.game_id]["name"]
  end

  def image
    request.protocol + request.host_with_port + object.image.url(:medium)
  end

end