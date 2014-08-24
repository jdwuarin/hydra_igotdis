class UserTournamentPointStandings < ActiveRecord::Base

  belongs_to :user
  belongs_to :tournament

  validates :user_id, presence: true
  validates :tournamnet_id, presence: true

end
