module Groups

  GROUP_A = GROUP_1 = 1
  GROUP_B = GROUP_2 = 2
  GROUP_C = GROUP_3 = 3
  GROUP_D = GROUP_4 = 4

  NAMES = {
    "Group A/1" => GROUP_A,
    "Group B/2" => GROUP_B,
    "Group C/3" => GROUP_C,
    "Group D/4" => GROUP_D,
  }

  INFO = {
    GROUP_A => {
      GroupNamingConventions::LETTERS => "Group A",
      GroupNamingConventions::NUMBERS => "Group 1",
    },
    GROUP_B => {
      GroupNamingConventions::LETTERS => "Group B",
      GroupNamingConventions::NUMBERS => "Group 2",
    },
    GROUP_C => {
      GroupNamingConventions::LETTERS => "Group C",
      GroupNamingConventions::NUMBERS => "Group 3",
    },
    GROUP_D => {
      GroupNamingConventions::LETTERS => "Group D",
      GroupNamingConventions::NUMBERS => "Group 4",
    }
  }

end