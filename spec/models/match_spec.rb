require 'spec_helper'
require 'spec_shared_context'

describe Match do

  include_context "instance_variables"

  subject { @match }

  it { should respond_to(:round) }
  it { should respond_to(:date) }
  it { should respond_to(:finished) }
  it { should respond_to(:receiving_contestant) }
  it { should respond_to(:invited_contestant) }
  it { should respond_to(:results) }

  it { should be_valid }

  describe "when round is not present" do
    before { @match.round = nil }
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
  describe "when start of match starts before start of round" do
    date_before_tournament = @round.start_date - 1
    before { @match.date = date_before_tournament }
    it { should_not be_valid }
  end
end


# TODO add a fucking test for when round is finished and points need
# to be distributed to the people who did the correct predictions



