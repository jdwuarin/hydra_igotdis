class TournamentContestant < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :tournament
  belongs_to :contestant, polymorphic: true
  belongs_to :team, -> { where(tournament_contestants:
                         {contestant_type: 'Team'}) },
                         foreign_key: 'contestant_id'
  belongs_to :player, -> { where(tournament_contestants:
                           {contestant_type: 'Player'}) },
                           foreign_key: 'contestant_id'
  # has many predictions and is referred to as predicted_contestant
  # in model referencing it
  has_many :user_match_predictions, as: :predicted_contestant

  has_many :matches_as_receiving_contestant,
           :as => :receiving_contestant, :class_name => 'Match'

  has_many :matches_as_invited_contestant,
           :as => :invited_contestant, :class_name => 'Match'

  validates :tournament_id, :contestant_id, :contestant_type, :uniqueness =>
            {:scope => [:tournament_id, :contestant_id, :contestant_type]}


end