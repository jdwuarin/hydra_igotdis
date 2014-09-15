require 'spec_helper'

describe UserMatchPrediction do

  before {@user_match_prediction = create(:user_match_prediction)}

  subject { @user_match_prediction }

  it { should respond_to(:match) }
  it { should respond_to(:prediction_type) }
  it { should respond_to(:predicted_contestant_type) }
  it { should respond_to(:predicted_contestant_id) }
  it { should respond_to(:user) }

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
    before { @user_match_prediction.predicted_contestant_type = nil }
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

  describe "when prediction_type is the one of a round" do
    before { @user_match_prediction.prediction_type = 6 }
    it { should_not be_valid }
  end

  describe "when prediction_type is the one of a match" do
    before { @user_match_prediction.prediction_type = 3 }
    it { should be_valid }
  end

  describe "when user has already done a prediciton of one type on match" do

    context "with identical prediction_type" do
      before do
        @same_prediction = build(:user_match_prediction,
                                 match: @user_match_prediction.match,
                                 user: @user_match_prediction.user)
      end
      subject { @same_prediction }
      it { should_not be_valid}
    end

    context "with different prediction_type" do
      before do
        @same_prediction = create(:user_match_prediction,
                                 match: @user_match_prediction.match,
                                 user: @user_match_prediction.user,
                                 prediction_type: 3)
      end
      subject { @same_prediction }
      it { should be_valid}
    end
  end

end