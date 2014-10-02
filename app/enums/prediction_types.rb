
module PredictionTypes

  # all Enums are modules with const values.
  # if the const values have info, it is mapped in
  # an INFO const

  WINNER = 1
  DRAW = 2
  MOSTFIRSTBLOOD = 3
  MOSTDRAGON = 4
  SCORE_2_0 = 5
  SCORE_2_1 = 6
  SCORE_3_0 = 7
  SCORE_3_1 = 8
  SCORE_3_2 = 9

  LIST = {
    WINNER => true,
    DRAW => true,
    MOSTFIRSTBLOOD => true,
    MOSTDRAGON => true,
    SCORE_2_0 => true,
    SCORE_2_1 => true,
    SCORE_3_0 => true,
    SCORE_3_1 => true,
    SCORE_3_2 => true
  }

  # classes of which lwc predictions can be part of
  LWC_GROUP_STAGE = 1
  LWC_QUARTER_FINALS = 2
  LWC_SEMI_FINALS = 3
  LWC_FINAL = 4

  # Info contains information for a prediciton type
  # in first position is the number of points the prediction
  # is worth, then the class the prediction is part of and
  # if available, the subclass it is of

  INFO = { 
    TournamentTypes::LOL_WORLD_CUP => {

      WINNER => {
        "points" => 100,
        "available_in" => [LWC_GROUP_STAGE, 
                           LWC_QUARTER_FINALS, 
                           LWC_SEMI_FINALS,
                           LWC_FINAL]
      },

      DRAW => {
        "points" => nil,
        "available_in" => []
      },

      MOSTFIRSTBLOOD => {
        "points" => 100,
        "available_in" => [LWC_SEMI_FINALS,
                           LWC_FINAL]
      },

      MOSTDRAGON => {
        "points" => 100,
        "available_in" => [LWC_FINAL]
      },

      SCORE_2_0 => {
        "points" => 100,
        "available_in" => []
      },

      SCORE_2_1 => {
        "points" => 100,
        "available_in" => []
      },

      SCORE_3_0 => {
        "points" => 100,
        "available_in" => [LWC_QUARTER_FINALS,
                           LWC_SEMI_FINALS,
                           LWC_FINAL]
      },

      SCORE_3_1 => {
        "points" => 100,
        "available_in" => [LWC_QUARTER_FINALS,
                           LWC_SEMI_FINALS,
                           LWC_FINAL]
      },

      SCORE_3_2 => {
        "points" => 100,
        "available_in" => [LWC_QUARTER_FINALS,
                           LWC_SEMI_FINALS,
                           LWC_FINAL]
      }

    }

  }

end