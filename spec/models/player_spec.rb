require 'spec_helper'

describe Player do

  before { @player = create(:player) }

  subject { @player }

  it { should respond_to(:username) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:player_position) }
  it { should respond_to(:date_of_birth) }
  it { should respond_to(:continent_id) }
  it { should respond_to(:game_id) }

  it { should be_valid }

  describe "when username is not present" do
    before { @player.username = " " }
    it { should_not be_valid }
  end
  describe "when player_position is not present" do
    before { @player.player_position = nil }
    it { should_not be_valid }
  end
  describe "when game_id is not present" do
    before { @player.game_id = nil }
    it { should_not be_valid }
  end

  describe "when username and game_id combination is not unique" do
      before do
        @player_with_same_credentials = @player.dup
        @player_with_same_credentials.continent_id = 2
      end

      subject { @player_with_same_credentials }
      it { should_not be_valid }
  end

  describe "when deleted that was part of a team," do

    before do
      create(:team_player, player: @player)
      @player.destroy
    end

    specify "team_player should also be deleted" do
      expect(TeamPlayer.count).to eq 0
    end
  end

end