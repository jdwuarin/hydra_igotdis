require 'rails_helper'

describe TeamPlayer do

  before { @team_player = create(:team_player) }

  subject { @team_player }

  it { should respond_to(:team) }
  it { should respond_to(:player) }
  it { should be_valid }

  describe "when team_id is not present" do
    before { @team_player.team = nil }
    it { should_not be_valid }
  end

  describe "when player_id is not present" do
    before { @team_player.player = nil }
    it { should_not be_valid }
  end

  describe "when team object is not present" do
    before { @team_player.team_id = 0 }
    it { should_not be_valid }
  end

  describe "when player object is not present" do
    before { @team_player.player_id = 0 }
    it { should_not be_valid }
  end

  describe "when team game different from player game" do
    before { @team_player.team.game_id = Games::DOTA_2 }
    it { should_not be_valid }
  end

end