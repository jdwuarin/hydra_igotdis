require 'spec_helper'

describe User do

  before { @user = create(:user) }
  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when username is absent" do
    before { @user.username = nil }
    it { should be_valid }
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

  describe "when creating a user and some tournaments are active" do

    before do
      @tournament_over = create(:tournament, 
        start_date: DateTime.new(2013, 1, 1),
        end_date: DateTime.new(2013, 1, 15))
      @tournament = create_list(:tournament, 3)
      @user = create(:user)
    end

    specify { expect(UserTournamentScore.count).to eq 3 }

  end

end