
module PredictionTypes

  # all Enums are modules with const values.
  # if the const values have info, it is mapped in
  # an INFO const

  WINNER = 1
  DRAW = 2
  FIRSTBLOOD = 3
  FIRSTTOWER = 4
  FIRSTINHIBITOR = 5
  SCORE_2_0 = 6
  SCORE_2_1 = 7
  SCORE_3_0 = 8
  SCORE_3_1 = 9
  SCORE_3_2 = 10

  # classes of which predictions can be part of
  ROUND_PREDICTION = 1
  MATCH_PREDICTION = 2
  BEST_OF_3 = 3
  BEST_OF_5 = 4

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