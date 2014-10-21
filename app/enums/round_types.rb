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

  active = true

  LIST = {
    GROUP_STAGE => active,
    QUARTER_FINALS => active,
    SEMI_FINALS => active,
    FINAL => active
  }

  INFO = {
    TournamentTypes::LOL_WORLD_CUP => {
      GROUP_STAGE => {
        "name" => "Group Stage",
        "point_multiplier" => 1,
        "matches_partial_name" => "lwc_stage_round_matches"
      },
      QUARTER_FINALS => {
        "name" => "Quarter Finals",
        "point_multiplier" => 3,
        "matches_partial_name" => "lwc_quarter_final_matches"
      },
      SEMI_FINALS => {
        "name" => "Semi Finals",
        "point_multiplier" => 6,
        "matches_partial_name" => "lwc_semi_final_matches"
      },
      FINAL => {
        "name" => "Final",
        "point_multiplier" => 9,
        "matches_partial_name" => "lwc_final_match"
      }
    }
  }

end