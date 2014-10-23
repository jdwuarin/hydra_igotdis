class Player < ActiveRecord::Base

  has_many :tournament_contestants, as: :contestant, :dependent => :destroy
  has_one :team_player, :dependent => :destroy
  has_one :team, through: :team_player
  belongs_to :player_position
  # many bets can be made on a single player (Starcraft only at time of writing)
  # and the player is referenced in the bet model as winner

  validates :username, presence: true
  validates :player_position, presence: true
  validates_presence_of :player_position
  validates :game_id, presence: true

  validates :username, :game_id,
            :uniqueness => {:scope => [:username, :game_id]}

  has_attached_file :avatar, :styles => { :large => "500x500>",
                                          :medium => "300x300>",
                                          :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_with PlayerPositionGameSameAsPlayerGame

  def to_s
    self.username + " player, " + Games::INFO[self.game_id]["name"] + " game"
  end

end
