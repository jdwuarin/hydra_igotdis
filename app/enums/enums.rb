module Enums

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

  PREDICTION_TYPES = { 1 => ["WINNER", 100, MATCH_PREDICTION],
                       2 => ["DRAW", 100, MATCH_PREDICTION],
                       3 => ["FIRSTKILL", 200, MATCH_PREDICTION],
                       4 => ["FIRSTTOWER", 200, MATCH_PREDICTION],
                       5 => ["FIRSTINHIBITOR", 200, MATCH_PREDICTION],
                       6 => ["SCORE_2_0", 200, ROUND_PREDICTION],
                       7 => ["SCORE_2_1", 200, ROUND_PREDICTION],
                       }

  # current mapping of continents

  CONTINENTS = { 1 => ["Asia"],
                 2 => ["Africa"],
                 3 => ["North America"],
                 4 => ["South America"],
                 5 => ["Antarctica"],
                 6 => ["Europe"],
                 7 => ["Australia"]
                }

  # mapping between game names and whether
  # a game is a team game. As in prediction_types,
  # we prefer mapping to an array.

  GAMES = { 1 => ["LOL", true],
            2 => ["DOTA", true],
            3 => ["Starcraft", false]
           }

  # the stage of the tournament impacts how
  # many points will be assigned to users
  # when their predictions are correct. The
  # second value is in fact the tournament_stage
  # multiplier.

  ROUND_TYPES = { 1 => "ROUND_1",
                  2 => "ROUND_2",
                  3 => "ROUND_3",
                  4 => "ROUND_4",
                }

end

