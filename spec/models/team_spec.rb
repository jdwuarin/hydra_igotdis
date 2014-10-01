require 'rails_helper'

describe Team do

  before { @team = create(:team) }

  subject { @team }

  it { should respond_to(:name) }
  it { should respond_to(:continent_id) }
  it { should respond_to(:game_id) }
  it { should respond_to(:team_players) }
  it { should respond_to(:players) }
  it { should respond_to(:tournament_contestants) }

  it { should be_valid }

  describe "when name is not present" do
    before { @team.name = " " }
    it { should_not be_valid }
  end

  describe "when game_id is not present" do
    before { @team.game_id = nil }
    it { should_not be_valid }
  end

  describe "when continent_id is not present" do
    before { @team.continent_id = nil }
    it { should_not be_valid }
  end

  describe "when name and game_id combination already exists" do
      before do
        @team_with_same_credentials = @team.dup
        @team_with_same_credentials.continent_id = 2
      end

      subject { @team_with_same_credentials }
      it { should_not be_valid }
  end

  describe "when deleted that had some dependent" do

    before do
      create(:team_player, team: @team)
      create(:tournament_contestant, contestant: @team)
      @team.destroy
    end

    specify "team_players should also be deleted" do
      expect(TeamPlayer.count).to eq 0
    end

    specify "tournament_contestants should also be deleted" do
      expect(TournamentContestant.count).to eq 0
    end

  end

end