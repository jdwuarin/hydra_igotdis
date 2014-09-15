require 'spec_helper'

describe UserRoundPrediction do

  before { @user_round_prediction = create(:user_round_prediction) }

  subject { @user_round_prediction }

  it { should respond_to(:round) }
  it { should respond_to(:prediction_type) }
  it { should respond_to(:predicted_contestant_type) }
  it { should respond_to(:predicted_contestant_id) }
  it { should respond_to(:user) }

  it { should be_valid }

  describe "when round is not present" do
    before { @user_round_prediction.round = nil }
    it { should_not be_valid }
  end

  describe "when prediction_type is not present" do
    before { @user_round_prediction.prediction_type = nil }
    it { should_not be_valid }
  end

  describe "when predicted_contestant_type is not present" do
    before { @user_round_prediction.predicted_contestant_type = nil }
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

  describe "when prediction_type is the one of a match" do
    before { @user_round_prediction.prediction_type = 3 }
    it { should_not be_valid }
  end

  describe "when prediction_type is the one of a round" do

    context "and prediction is done for roundup best out of 3" do

    end

    before { @user_round_prediction.prediction_type = 6 }
    it { should be_valid }
  end

  describe "when user has already done a prediction on round" do

    context "with identical prediction_type" do
      before do
        @same_prediction = build(:user_round_prediction,
                                 round: @user_round_prediction.round,
                                 user: @user_round_prediction.user)
      end
      subject { @same_prediction }
      it { should_not be_valid}
    end

    context "with different prediction_type" do
      before do
        @same_prediction = build(:user_round_prediction,
                                 round: @user_round_prediction.round,
                                 user: @user_round_prediction.user,
                                 prediction_type: 7)
      end
      subject { @same_prediction }
      it { should_not be_valid}
    end
  end

  describe "when user does a prediction on round of type ROUND_1" do
    before do
      @user_round_prediction.round.round_type = 1
    end
    it { should_not be_valid }
  end

end