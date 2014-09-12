# currently predicitons type are simply
# a dictionary where the id of the type is
# mapped to its name and the value representing the points
# won by the user who correctly predicts
# an event of this type before aplplying the 
# tournament_stage multiplicator
# values are put in arrays so that other information
# can later be added to the prediction_types without
# requiring a huge code refactor

ROUND_PREDICTION = 0
MATCH_PREDICTION = 1

prediction_types = { 1 => ["WINNER", 100, MATCH_PREDICTION],
                     2 => ["DRAW", 100, MATCH_PREDICTION],
                     3 => ["FIRSTKILL", 200, MATCH_PREDICTION],
                     4 => ["FIRSTTOWER", 2, MATCH_PREDICTION],
                     5 => ["FIRSTINHIBITOR", 2, MATCH_PREDICTION],
                     6 => ["SCORE_2_0", 200, ROUND_PREDICTION],
                     7 => ["SCORE_2_1", 200, ROUND_PREDICTION],
                   }