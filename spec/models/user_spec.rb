require 'spec_helper'

describe User do

  before { @user = create(:user) }
  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when username is too short" do
    before { @user.username = "a" * 1 }
    it { should_not be_valid }
  end

  describe "when username is too long" do
    before { @user.username = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before do
      @user_with_same_username = create(:user)
      @user_with_same_username.username = @user.username.upcase
      @user_with_same_username.save
    end
    subject {@user_with_same_username}
    it { should_not be_valid }
  end

  describe "when deleted that has some dependent" do

    before do
      create(:user_match_prediction, user: @user)
      create(:user_tournament_score, user: @user)
      @user.destroy
    end

    specify "user_match_predictions should also be deleted" do
      expect(UserMatchPrediction.count).to eq 0
    end

    specify "user_tournament_scores should also be deleted" do
      expect(UserTournamentScore.count).to eq 0
    end
  end

end