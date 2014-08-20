# currently predicitons type are simply
# a dictionary where the id of the type is
# mapped to its name and the value representing the points
# won by the user who correctly predicts
# an event of this type.
# values are put in arrays so that other information
# can later be added to the prediction_types without
# requiring a huge code refactor

prediction_types = { 1 => ["WINNER", 1],
                     2 => ["LOSER", 1],
                     3 => ["DRAW", 1],
                     4 => ["FIRSTKILL", 2],
                     5 => ["FIRSTINHIBITOR", 2]
                   }