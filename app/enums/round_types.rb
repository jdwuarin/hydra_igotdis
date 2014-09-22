# the stage of the tournament impacts how
# many points will be assigned to users
# when their predictions are correct. The
# second value is in fact the tournament_stage
# multiplier.


module RoundTypes

  GROUP_STAGE = 1
  QUARTER_FINALS = 2
  SEMI_FINALS = 3
  FINAL = 4

  INFO = {
    TournamentTypes::LOL_WORLD_CUP => {
      GROUP_STAGE => {
        "name" => "Group Stage",
        "point_multiplier" => 1,
        "matches_partial_name" => "lwc_stage_round_match"
      },
      QUARTER_FINALS => {
        "name" => "Quarter Finals",
        "point_multiplier" => 6,
        "matches_partial_name" => "lwc_quarter_final_match"
      },
      SEMI_FINALS => {
        "name" => "Semi Finals",
        "point_multiplier" => 10,
        "matches_partial_name" => "lwc_semi_final_match"
      },
      FINAL => {
        "name" => "Final",
        "point_multiplier" => 15,
        "matches_partial_name" => "lwc_final_match"
      }
    }
  }

end