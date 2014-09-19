require 'spec_helper'

describe Tournament do

  before { @tournament = create(:tournament)}

  subject { @tournament }

  it { should respond_to(:name) }
  it { should respond_to(:start_date) }
  it { should respond_to(:venue) }
  it { should respond_to(:end_date) }
  it { should respond_to(:game_id) }
  it { should respond_to(:continent_id) }
  it { should respond_to(:tournament_type) }
  it { should respond_to(:tournament_contestants) }

  it { should be_valid }

  describe "when name is not present" do
    before { @tournament.name = " " }
    it { should_not be_valid }
  end
  describe "when tournament_type is not present" do
    before { @tournament.tournament_type = nil }
    it { should_not be_valid }
  end
  describe "when game_id is not present" do
    before { @tournament.game_id = nil }
    it { should_not be_valid }
  end
  describe "when game_id is not present" do
    before { @tournament.game_id = nil }
    it { should_not be_valid }
  end

  describe "when has_groups is true" do
    before { @tournament_with_groups = create(:tournament_with_groups) }

    subject { @tournament_with_groups }

    context "and group_count is not present" do
      before { @tournament_with_groups.group_count = nil}
      it { should_not be_valid }
    end

    context "and group_naming_convention is not present" do
      before { @tournament_with_groups.group_naming_convention = nil}
      it { should_not be_valid }
    end

    context "and group info is present" do
      it { should be_valid }
    end
  end

  describe "when start_date is not present" do
    before { @tournament.start_date = nil }
    it { should_not be_valid }
  end
  describe "should start before it ends" do
    before do
      date_before_tournament = @tournament.start_date - 1
      @tournament.end_date = date_before_tournament 
    end
    it { should_not be_valid }
  end
end