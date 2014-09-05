require 'spec_helper'
require 'spec_shared_context'

describe Player do

  include_context "instance_variables"

  subject { @player_1 }

  it { should respond_to(:username) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:player_position_id) }
  it { should respond_to(:date) }
  it { should respond_to(:continent_id) }
  it { should respond_to(:game_id) }

  it { should be_valid }

  describe "when username is not present" do
    before { @player_1.username = " " }
    it { should_not be_valid }
  end
  describe "when player_position_id is not present" do
    before { @player_1.player_position_id = nil }
    it { should_not be_valid }
  end
  describe "when game_id is not present" do
    before { @player_1.game_id = nil }
    it { should_not be_valid }
  end

  describe "when username and game_id combination is not unique" do
      before do
        player_with_same_credentials = @player_1.dup
        player_with_same_credentials.continent_id = 2
        player_with_same_credentials.save
      end

      it { should_not be_valid }
  end
  describe "when game_id is changed" do
      before do
        player_with_same_credentials = @player_1.dup
        player_with_same_credentials.game_id = 2
        player_with_same_credentials.save
      end

      it { should be_valid }
  end
  describe "when username is changed" do
      before do
        player_with_same_credentials = @player_1.dup
        player_with_same_credentials.username = "Test Name"
        player_with_same_credentials.save
      end

      it { should be_valid }
  end
end