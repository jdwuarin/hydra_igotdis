require 'spec_helper'
require 'spec_shared_context'

describe Prediction do
  include_context "instance_variables"

  subject { @prediction }

  it { should respond_to(:match_id) }
  it { should respond_to(:prediction_type) }
  it { should respond_to(:predicted_contestant_type) }
  it { should respond_to(:predicted_contestant_id) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when match_id is not present" do
    before { @prediction.match_id = nil }
    it { should_not be_valid }
  end
  describe "when prediction_type is not present" do
    before { @player_position.prediction_type = " " }
    it { should_not be_valid }
  end
  describe "when predicted_contestant_type is not present" do
    before { @player_position.predicted_contestant_type = " " }
    it { should_not be_valid }
  end
  describe "when predicted_contestant_id is not present" do
    before { @player_position.predicted_contestant_id = nil }
    it { should_not be_valid }
  end
  describe "when user_id is not present" do
    before { @player_position.user_id = nil }
    it { should_not be_valid }
  end
end