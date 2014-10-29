class UserTournamentScore < ActiveRecord::Base

  belongs_to :user
  belongs_to :tournament

  validates :user, presence: true
  validates :tournament, presence: true

  validates :user_id, :tournament_id,
            :uniqueness => {:scope => [:user_id, :tournament_id]}

  default_scope -> { order('score DESC') }

end
