require 'spec_helper'
require 'spec_shared_context'

describe Match do

  include_context "instance_variables"

  subject { @match }

  it { should respond_to(:tournament_id) }
  it { should respond_to(:date) }
  it { should respond_to(:finished) }
  it { should respond_to(:receiving_contestant) }
  it { should respond_to(:invited_contestant) }
  it { should respond_to(:results) }

  it { should be_valid }

  describe "when tournamen_id is not present" do
    before { @match.tournament_id = nil }
    it { should_not be_valid }
  end
  describe "when date is not present" do
    before { @match.date = nil }
    it { should_not be_valid }
  end
  describe "when receiving_contestant is not present" do
    before { @match.receiving_contestant = nil }
    it { should_not be_valid }
  end
  describe "when invited_contestant is not present" do
    before { @match.invited_contestant = nil }
    it { should_not be_valid }
  end
  describe "when contestant types do not match" do
    before { @match.invited_contestant = @player_1 }
    it { should_not be_valid }
  end
  describe "when contestants are the same" do
    before { @match.invited_contestant = @team_1 }
    it { should_not be_valid }
  end
  describe "when start of match starts before start of tournament" do
    date_before_tournament = @tournament.start_date - 1
    before { @match.date = date_before_tournament }
    it { should_not be_valid }
  end
  describe "when start of match starts after end of tournament" do
    date_after_tournament = @tournament.start_date + 1
    before { @match.date = date_after_tournament }
    it { should_not be_valid }
  end
end



