require 'spec_helper'
require 'spec_shared_context'

describe Team do
  include_context "instance_variables"

  subject { @team_1 }

  it { should respond_to(:name) }
  it { should respond_to(:continent_id) }
  it { should respond_to(:game_id) }

  it { should be_valid }

  describe "when name is not present" do
    before { @team_1.name = " " }
    it { should_not be_valid }
  end

  describe "when game_id is not present" do
    before { @team_1.game_id = nil }
    it { should_not be_valid }
  end

  describe "when continent_id is not present" do
    before { @team_1.continent_id = nil }
    it { should_not be_valid }
  end

  describe "when name and game_id combination already exists" do
      before do
        team_with_same_credentials = @team_1.dup
        team_with_same_credentials.continent_id = 2
        team_with_same_credentials.save
      end

      it { should_not be_valid }
  end

end