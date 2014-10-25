module Games

  LOL = 1
  DOTA_2 = 2
  STARCRAFT_2 = 3

  # mapping between game names and whether
  # a game is a team game. As in prediction_types,
  # we prefer mapping to an array.

  NAMES = {
    "league of legends" => LOL,
    "Defense of the Ancients 2" => DOTA_2,
    "Starcraft 2" => STARCRAFT_2
  }

  INFO = {
    LOL => {
      "name" => "League of Legends",
      "team_game" => true,
      "user_nomenclature" => "summoner",
      "character_nomenclature" => "champion"
    },
    DOTA_2 => {
      "name" => "Defense of the Ancients 2",
      "team_game" => true,
      "user_nomenclature" => "player",
      "character_nomenclature" => "hero",
    },
    STARCRAFT_2 => {
      "name" => "Starcraft 2",
      "team_game" => false,
      "user_nomenclature" => "player",
      "character_nomenclature" => "race"
    },
  }

end