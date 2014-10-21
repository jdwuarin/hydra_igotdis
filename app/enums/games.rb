module Games

  LOL = 1
  DOTA_2 = 2
  STARCRAFT_2 = 3

  # mapping between game names and whether
  # a game is a team game. As in prediction_types,
  # we prefer mapping to an array.


  INFO = {
    LOL => {
      "team_game" => true,
      "user_nomenclature" => "summoner",
      "character_nomenclature" => "champion"
      },
    DOTA_2 => {
      "team_game" => true,
      "user_nomenclature" => "",
      "character_nomenclature" => "hero",
      "api" => {
        "key" => "1328C1674312F4020F4D6DFC828830A8",
      }
    },
    STARCRAFT_2 => {
      "team_game" => false,
      "user_nomenclature" => "",
      "character_nomenclature" => "race"
      },
  }

end