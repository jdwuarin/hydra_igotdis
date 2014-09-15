# the stage of the tournament impacts how
# many points will be assigned to users
# when their predictions are correct. The
# second value is in fact the tournament_stage
# multiplier.


module RoundTypes

  BRACKET_ROUND = 0
  QUARTER_FINAL = 1
  SEMI_FINAL = 2
  FINAL = 3

  INFO = {
    TournamentTypes::LOL_WORLD_CUP => {
      BRACKET_ROUND => {
        "point_multiplier" => 1
      },
      QUARTER_FINAL => {
        "point_multiplier" => 6
      },
      SEMI_FINAL => {
        "point_multiplier" => 10
      },
      FINAL => {
        "point_multiplier" => 15
      }
    }
  }

end