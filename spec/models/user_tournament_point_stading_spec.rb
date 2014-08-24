require 'spec_helper'
require 'spec_shared_context'

describe UserTournamentPointStandings do

include_context "instance_variables"

  subject { @user_tournament_point_standing }

  it { should respond_to(:user_id) }
  it { should respond_to(:tournament_id) }
  it { should respond_to(:points) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @user_tournament_point_standing.user_id = nil }
    it { should_not be_valid }
  end
  describe "when tournament_id is not present" do
    before { @user_tournament_point_standing.tournament_id = nil }
    it { should_not be_valid }
  end
end