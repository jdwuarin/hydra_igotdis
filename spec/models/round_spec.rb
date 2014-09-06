require 'spec_helper'
require 'spec_shared_context'

describe round do

  include_context "instance_variables"

  subject { @round }

  it { should respond_to(:tournament) }
  it { should respond_to(:round_type) }
  it { should respond_to(:points_multiplier) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:is_direct_elimination_round) }
  it { should respond_to(:finished) }
  it { should respond_to(:receiving_contestant) }
  it { should respond_to(:invited_contestant) }

  it { should be_valid }

  describe "when tournament is not present" do
    before { @round.tournament = nil }
    it { should_not be_valid }
  end

  describe "when round_type is not present" do
    before { @round.round_type = nil }
    it { should_not be_valid }
  end

  describe "when points_multiplier is not present" do
    before { @round.points_multiplier = nil }
    it { should_not be_valid }
  end

  describe "when start_date is not present" do
    before { @round.start_date = nil }
    it { should_not be_valid }
  end

  describe "when is_direct_elimination_round is false,
            contestants should not be specified" do
    before do
      @round.is_direct_elimination_round = false
      @round.receiving_contestant = @team_1
      @round.invited_contestant = @team_2
    end

    it { should_not be_valid }

    before do
      @round.is_direct_elimination_round = false
      @round.receiving_contestant = nil
      @round.invited_contestant = @team_2
    end

    it { should_not be_valid }

    before do
      @round.is_direct_elimination_round = false
      @round.receiving_contestant = nil
      @round.invited_contestant = nil
    end

    it { should be_valid }
  end

  describe "when is_direct_elimination_round is true,
            contestants should be specified" do
    before do
      @round.is_direct_elimination_round = true
      @round.receiving_contestant = nil
      @round.invited_contestant = nil
    end

    it { should_not be_valid }

    before do
      @round.is_direct_elimination_round = true
      @round.receiving_contestant = nil
      @round.invited_contestant = @team_2
    end

    it { should_not be_valid }

    before do
      @round.is_direct_elimination_round = true
      @round.receiving_contestant = @team_1
      @round.invited_contestant = @team_2
    end

    it { should be_valid }
  end

  describe "when contestant types are not the same" do
    before { @round.invited_contestant = @player_1 }
    it { should_not be_valid }
  end
  describe "when contestants are the same" do
    before { @round.invited_contestant = @team_1 }
    it { should_not be_valid }
  end

  describe "should start before it ends" do
    date_before_round = @round.start_date - 1
    before { @round.end_date = date_before_round }
    it { should_not be_valid }
  end

  describe "when start of round starts before start of tournament" do
    before do
      date_before_tournament = @tournament.start_date - 1
      @round.start_date = date_before_tournament
    end

    it { should_not be_valid }
  end

  describe "when end of round starts after end of tournament" do
    before do
      date_after_tournament = @tournament.end_date + 1
      @round.end_date = date_after_tournament
    end

    it { should_not be_valid }
  end
end


# TODO add a fucking test for when round is finished and points need
# to be distributed to the people who did the correct predictions


