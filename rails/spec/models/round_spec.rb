require 'rails_helper'

describe Round do

  before { @round = create(:round)}

  subject { @round }

  it { should respond_to(:tournament) }
  it { should respond_to(:round_type) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:is_direct_elimination_round) }
  it { should respond_to(:matches) }

  it { should be_valid }

  describe "when tournament is not present" do
    before { @round.tournament = nil }
    it { should_not be_valid }
  end

  describe "when round_type is not present" do
    before { @round.round_type = nil }
    it { should_not be_valid }
  end

  describe "when start_date is not present" do
    before { @round.start_date = nil }
    it { should_not be_valid }
  end

  describe "when is_direct_elimination_round is not present" do
    before { @round.is_direct_elimination_round = nil }
    it { should_not be_valid }
  end

  describe "round_type should be a valid number" do
    before { @round.round_type = 0 }
    it { should_not be_valid }
  end

  describe "should start before it ends" do
    before do
      date_before_round = @round.start_date - 1
      @round.end_date = date_before_round
    end

    it { should_not be_valid }
  end

  describe "when start of round starts before start of tournament" do
    before do
      date_before_tournament = @round.tournament.start_date - 1
      @round.start_date = date_before_tournament
    end

    it { should_not be_valid }
  end

  describe "when end of round starts after end of tournament" do
    before do
      date_after_tournament = @round.tournament.end_date + 1
      @round.end_date = date_after_tournament
    end

    it { should_not be_valid }
  end

end


