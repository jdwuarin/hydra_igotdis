require 'spec_helper'

describe PlayerPosition do

  before do
    @player_position = PlayerPosition.new(name: "Example player position",
                                          game_id: 1)
  end

  subject { @player_position }

  it { should respond_to(:name) }
  it { should respond_to(:game_id) }

  it { should be_valid }

  describe "when name is not present" do
    before { @player_position.name = " " }
    it { should_not be_valid }
  end
  describe "when game_id is not present" do
    before { @player_position.game_id = nil }
    it { should_not be_valid }
  end
end