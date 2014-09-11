require 'spec_helper'

describe UserMatchPrediction do

  subject { @user_match_prediction }

  it { should respond_to(:match_id) }
  it { should respond_to(:user_round_prediction) }
  it { should respond_to(:prediction_type) }
  it { should respond_to(:predicted_contestant_type) }
  it { should respond_to(:predicted_contestant_id) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when match_id is not present" do
    before { @user_match_prediction.match_id = nil }
    it { should_not be_valid }
  end

  describe "when prediction_type is not present" do
    before { @user_match_prediction.prediction_type = " " }
    it { should_not be_valid }
  end

  describe "when predicted_contestant_type is not present" do
    before { @user_match_prediction.predicted_contestant_type = " " }
    it { should_not be_valid }
  end

  describe "when predicted_contestant is not present" do
    before { @user_match_prediction.predicted_contestant = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @user_match_prediction.user_id = nil }
    it { should_not be_valid }
  end

  describe "prediction should have an appropriate prediction type" do
    before { @user_round_prediction.prediction_type = 6 }
    it { should_not be_valid }
    before { @user_round_prediction.prediction_type = 1 }
    it { should be_valid }
    before { @user_round_prediction.prediction_type = 3 }
    it { should_not be_valid }
  end

  describe "user can only do one prediction of one type per match" do

  end

end