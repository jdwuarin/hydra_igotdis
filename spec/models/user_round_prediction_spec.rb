require 'spec_helper'

describe UserRoundPrediction do

  subject { @user_round_prediction }

  it { should respond_to(:round) }
  it { should respond_to(:prediction_type) }
  it { should respond_to(:predicted_contestant_type) }
  it { should respond_to(:predicted_contestant_id) }
  it { should respond_to(:user) }

  it { should be_valid }

  describe "when round_id is not present" do
    before { @user_round_prediction.round = nil }
    it { should_not be_valid }
  end

  describe "round should be above 0" do
    before { @user_round_prediction.round = 0 }
    it { should_not be_valid }
  end

  describe "round id should be below 5" do
    before { @user_round_prediction.round = 5 }
    it { should_not be_valid }
  end

  describe "when prediction_type is not present" do
    before { @user_round_prediction.prediction_type = " " }
    it { should_not be_valid }
  end

  describe "when predicted_contestant_type is not present" do
    before { @user_round_prediction.predicted_contestant_type = " " }
    it { should_not be_valid }
  end

  describe "when predicted_contestant is not present" do
    before { @user_round_prediction.predicted_contestant = nil }
    it { should_not be_valid }
  end

  describe "when user is not present" do
    before { @user_round_prediction.user = nil }
    it { should_not be_valid }
  end

  describe "prediction should have an appropriate prediction type" do
    before { @user_round_prediction.prediction_type = 3 }
    it { should_not be_valid }
    before { @user_round_prediction.prediction_type = 1 }
    it { should be_valid }
    before { @user_round_prediction.prediction_type = 6 }
    it { should_not be_valid }
  end

  describe "user can only do one prediction per round" do

    context "with prediction_type identical" do

    end

    context "with prediction_type different" do

    end

  end

  describe "cannot do any actual predictions on round of type ROUND_1" do
    before do
      type_1_round = Round.new(tournament: @tournament,
                               round_type: 1,
                               points_multiplier: 1,
                               start_date: DateTime.yesterday + 1.hour,
                               end_date: DateTime.yesterday + 1.day,
                               is_direct_elimination_round: false,
                               receiving_contestant: @team_1,
                               invited_contestant: @team_2)
      type_1_round.save
      @user_round_prediction.round = type_1_round
      @user_round_prediction.save
    end
    it { should_not be_valid }
  end

end