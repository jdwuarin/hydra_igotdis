require 'spec_helper'

describe TournamentContestant do

  before { @tournament_contestant = create(:tournament_contestant)}

  subject { @tournament_contestant }

  it { should respond_to(:tournament) }
  it { should respond_to(:contestant) }
  it { should respond_to(:user_match_predictions) }
  it { should respond_to(:user_round_predictions) }
  it { should respond_to(:rounds_as_receiving_contestant) }
  it { should respond_to(:rounds_as_invited_contestant) }
  it { should respond_to(:matches_as_receiving_contestant) }
  it { should respond_to(:matches_as_invited_contestant) }

  it { should be_valid }
end