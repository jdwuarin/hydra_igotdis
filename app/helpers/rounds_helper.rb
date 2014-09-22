module RoundsHelper

  # Returns the correct round stage name for a round
  def get_round_info(round, options = { key_name: "" })
    key_name = options[:key_name]
    name = RoundTypes::INFO[
      round.tournament.tournament_type][
      round.round_type][key_name]
  end

end