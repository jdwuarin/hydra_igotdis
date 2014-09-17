# SUGARGLIDER match results format for LOL World Cup:
# Winner : must always be here
# Score : must be present for rounds 2-4
# First blood : present for rounds 3-4
# First tower, first inhibitor: Phase 4
# all that is coded in validators that check for the type of
# the results before doing the check

def get_empty_LWC_results_format
  contestant_results = {
    "winner" => nil,
    "first_blood" => nil,
    "first_tower" => nil,
    "first_inhibitor" => nil,
  }

  lwc_match_results_format = {
    "type" => "lwc_results_format",
    "receiving_contestant" => contestant_results,
    "invited_contestant" => contestant_results.clone,
  }

  lwc_match_results_format
end

