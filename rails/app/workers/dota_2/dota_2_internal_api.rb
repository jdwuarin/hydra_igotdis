class GamesApi

  def initialize(game)

    if game == Games::LOL
      initialize_lol
    elsif game == Games::DOTA_2
      initialize_dota_2
    elsif game == Games::initialize_starcraft_2
      initialize_starcraft_2
    end

  end

  def initialize_lol
    @game = Games::LOL

  end

  def initialize_dota_2
    @game = Games::DOTA_2
    @api_key = "1328C1674312F4020F4D6DFC828830A8"
    @base_api = ""
    @results

  end

  def initialize_starcraft_2
    @game = Games::STARCRAFT_2

  end

  def update_characters_list
    # just get all characters and update that shit.
  end

  def get_latest_results
    # this routine gets all the latest results from premium matches
    # and then, when ncessary, 

  end

  def get_match_results()

  end


end