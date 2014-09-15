module Games

  LOL = 0
  DOTA = 1
  STARCRAFT = 2

  # mapping between game names and whether
  # a game is a team game. As in prediction_types,
  # we prefer mapping to an array.

  TEAM_GAME = true

  INFO = {
    LOL => [TEAM_GAME],
    DOTA => [!TEAM_GAME],
    STARCRAFT => [!TEAM_GAME]
  }

end