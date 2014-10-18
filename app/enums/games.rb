module Games

  LOL = 1
  DOTA_2 = 2
  STARCRAFT_2 = 3

  # mapping between game names and whether
  # a game is a team game. As in prediction_types,
  # we prefer mapping to an array.

  TEAM_GAME = true

  INFO = {
    LOL => [TEAM_GAME],
    DOTA_2 => [TEAM_GAME],
    STARCRAFT_2 => [!TEAM_GAME]
  }

end