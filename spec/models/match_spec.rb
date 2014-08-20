require 'spec_helper'

describe Match do

  before do
    @venue = Venue.new(name: "Example Venue")
    @tournament = Tournament.new(name: "Example Tournament",
                                 game_id: 1,
                                 start_date: DateTime.now,
                                 end_date: DateTime.tomorrow,
                                 venue_id: @venue.id,
                                 continent_id: 1)
    @team_1 =
    @team_2 = 
    @match = Match.new(tournament_id: @tournament.id,
                       date: DateTime.now,
                       finished: false,
                       receiving_contestant: team_1,
                       invited_contestant: team_2,
                       results: {})
  end

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
    player_1 = 
    before { @match.invited_contestant = player_1 }
    it { should_not be_valid }
  end
  describe "when start of match starts before start of tournament" do
    date_before_tournament = @tournament.start_date - 1
    before { @match.date = date_before_tournament }
    it { should_not be_valid }
  end
  describe "when start of match starts after end of tournament" do
    date_before_tournament = @tournament.start_date + 1
    before { @match.date = date_before_tournament }
    it { should_not be_valid }
  end
end



