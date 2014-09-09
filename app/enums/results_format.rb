# SUGARGLIDER match results format for LOL tournament 1:
# Winner : must always be here
# Score : must be present for rounds 2-4
# First blood : present for rounds 3-4
# First tower, first inhibitor: Phase 4

contestant_results = {
  "winner" => nil,
  "first_blood" => nil,
  "first_tower" => nil,
  "first_inhibitor" => nil,
}

LOL_match_results_format_1 = {
  "receiving_contestant" => contestant_results,
  "invited_contestant" => contestant_results,
}