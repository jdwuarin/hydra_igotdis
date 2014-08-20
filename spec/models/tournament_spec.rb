require 'spec_helper'

describe Tournament do

  before do
    @venue = Venue.new(name: "Example Venue")
    @tournament = Tournament.new(name: "Example Tournament",
                                 game_id: 1,
                                 start_date: DateTime.now,
                                 end_date: DateTime.tomorrow,
                                 venue_id: @venue,
                                 continent_id: 1)
  end

  subject { @tournament }

  it { should respond_to(:name) }
  it { should respond_to(:game_id) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:venue_id) }
  it { should respond_to(:continent_id) }

  it { should be_valid }

  describe "when name is not present" do
    before { @tournament.name = " " }
    it { should_not be_valid }
  end
  describe "when game_id is not present" do
    before { @tournament.game_id = nil }
    it { should_not be_valid }
  end
  describe "when start_date is not present" do
    before { @tournament.start_date = nil }
    it { should_not be_valid }
  end
end