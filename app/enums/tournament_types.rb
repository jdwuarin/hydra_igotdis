module TournamentTypes


  DEFAULT_LOL = 1
  DEFAULT_DOTA_2 = 2
  DEFAULT_STARCRAFT_2 = 3
  LOL_WORLD_CUP = 4

  NAMES = {
    "Default LoL tournament" => DEFAULT_LOL,
    "Default DotA 2 tournament" => DEFAULT_DOTA_2,
    "Default Starcraft 2 tournament" => DEFAULT_STARCRAFT_2,
    "LoL World Championship" => LOL_WORLD_CUP
  }

  INFO = {
    DEFAULT_LOL => {
      "name" => "Default LoL tournament",
      "game" => Games::LOL
    },

    DEFAULT_DOTA_2 => {
      "name" => "Default DotA 2 tournament",
      "game" => Games::DOTA_2
    },

    DEFAULT_STARCRAFT_2 => {
      "name" => "Default Starcraft 2 tournament",
      "game" => Games::STARCRAFT_2
    },
    
    LOL_WORLD_CUP => {
      "name" => "LoL World Championship",
      "game" => Games::LOL
    },
  }

end