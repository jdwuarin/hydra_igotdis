class TournamentContestant < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :tournament
  belongs_to :contestant, polymorphic: true
  # has many predictions and is referred to as predicted_contestant
  # in model referencing it
  has_many :user_round_predictions, as: :predicted_contestant
  has_many :user_match_predictions, as: :predicted_contestant
  has_many :rounds_as_receiving_contestant, :as => :receiving_contestant, :class_name => 'Round'
  has_many :rounds_as_invited_contestant, :as => :invited_contestant, :class_name => 'Round'
  has_many :matches_as_receiving_contestant, :as => :receiving_contestant, :class_name => 'Match'
  has_many :matches_as_invited_contestant, :as => :invited_contestant, :class_name => 'Match'

end