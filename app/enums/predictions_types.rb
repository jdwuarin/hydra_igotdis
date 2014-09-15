
module PredictionTypes

  # all Enums are modules with const values.
  # if the const values have info, it is mapped in
  # an INFO const

  WINNER = 0
  DRAW = 1
  FIRSTBLOOD = 2
  FIRSTTOWER = 3
  FIRSTINHIBITOR = 4
  SCORE_2_0 = 5
  SCORE_2_1 = 6
  SCORE_3_0 = 7
  SCORE_3_1 = 8
  SCORE_3_2 = 9

  # classes of which predictions can be part of
  ROUND_PREDICTION = 0
  MATCH_PREDICTION = 1
  BEST_OF_3 = 3
  BEST_OF_5 = 5

  # Info contains information for a prediciton type
  # in first position is the number of points the prediction
  # is worth, then the class the prediction is part of and
  # if available, the subclass it is of
  INFO = { WINNER => [120, MATCH_PREDICTION],
           DRAW => [nil, MATCH_PREDICTION], # nil for now. To make sure it returns error if done
           FIRSTBLOOD => [24, MATCH_PREDICTION],
           FIRSTTOWER => [24, MATCH_PREDICTION],
           FIRSTINHIBITOR => [24, MATCH_PREDICTION],
           SCORE_2_0 => [120, ROUND_PREDICTION, BEST_OF_3],
           SCORE_2_1 => [120, ROUND_PREDICTION, BEST_OF_3],
           SCORE_3_0 => [120, ROUND_PREDICTION, BEST_OF_5],
           SCORE_3_1 => [120, ROUND_PREDICTION, BEST_OF_5],
           SCORE_3_2 => [120, ROUND_PREDICTION, BEST_OF_5]
         }

end