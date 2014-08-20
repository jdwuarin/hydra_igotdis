require 'spec_helper'

describe Player do

  before do
    @player = PlayerPosition.new(user_name: "Example name",
                                 first_name: "Example first name",
                                 last_name: "Example last name",
                                 player_position_id: 1,
                                 date: Datetime.today - 1000,
                                 continent_id: 1,
                                 game_id: 1)
  end

  subject { @player_position }

  it { should respond_to(:user_name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:player_position_id) }
  it { should respond_to(:date) }
  it { should respond_to(:continent_id) }
  it { should respond_to(:game_id) }

  it { should be_valid }

  describe "when user_name is not present" do
    before { @player.user_name = " " }
    it { should_not be_valid }
  end
  describe "when player_position_id is not present" do
    before { @player.player_position_id = nil }
    it { should_not be_valid }
  end
  describe "when game_id is not present" do
    before { @player.game_id = nil }
    it { should_not be_valid }
  end
end