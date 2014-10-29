# SUGARGLIDER match results format for LOL World Cup:
# Winner : must always be here
# Score : must be present for rounds 2-4
# First blood : present for rounds 3-4
# First tower, first inhibitor: Phase 4
# all that is coded in validators that check for the type of
# the results before doing the check

module ResultsFormat

  LWC_MAX_QUARTER_FINAL_SCORE = 3
  LWC_MAX_OTHER_SCORE = 3

  LWC_RESULTS_FORMAT = {

    "type" => TournamentTypes::LOL_WORLD_CUP,

    "receiving_contestant" => {
      "winner" => -1,
      "score" => 0,
      "most_dragon" => -1,
      "most_first_blood" => -1
    },

    "invited_contestant" => {
      "winner" => -1,
      "score" => 0,
      "most_dragon" => -1,
      "most_first_blood" => -1
    }

  }

end

