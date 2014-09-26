# SUGARGLIDER match results format for LOL World Cup:
# Winner : must always be here
# Score : must be present for rounds 2-4
# First blood : present for rounds 3-4
# First tower, first inhibitor: Phase 4
# all that is coded in validators that check for the type of
# the results before doing the check

module ResultsFormat

  MAX_QUARTER_FINAL_SCORE = 2
  MAX_OTHER_SCORE = 3

  LWC_RESULTS_FORMAT = {

    "type" => "lwc_results_format",

    "receiving_contestant" => {
      "winner" => nil,
      "score" => 0,
      "most_dragon" => nil,
      "most_first_blood" => nil
    },

    "invited_contestant" => {
      "winner" => nil,
      "score" => 0,
      "most_dragon" => nil,
      "most_first_blood" => nil
    }

  }

end

