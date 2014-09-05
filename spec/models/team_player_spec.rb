require 'spec_helper'
require 'spec_shared_context'

describe TeamPlayer do
  include_context "instance_variables"

  subject { @team_player_1 }

  it { should respond_to(:team_id) }
  it { should respond_to(:player_id) }
  it { should be_valid }

  describe "when team_id is not present" do
    before { @team_player_1.team_id = nil }
    it { should_not be_valid }
  end

  describe "when player_id is not present" do
    before { @team_player_1.player_id = nil }
    it { should_not be_valid }
  end

  describe "when player_1 is destroyed" do
    before { @player_1.destroy }
    it { should eq(nil) }
  end

  describe "when team_1 is destroyed" do
    before { @team_1.destroy }
    it { should eq(nil) }
  end

end