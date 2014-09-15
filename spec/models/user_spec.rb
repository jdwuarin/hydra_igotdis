require 'spec_helper'

describe User do

  before { @user = create(:user) }
  subject { @user }

  it { should respond_to(:email) }

  it { should be_valid }

  describe "upon deletion that has some dependent" do

    before do
      create(:user_round_prediction, user: @user)
      create(:user_match_prediction, user: @user)
      create(:user_tournament_score, user: @user)
      @user.destroy
    end

    specify "user_round_predictions should also be deleted" do
      expect(UserRoundPrediction.count).to eq 0
    end

    specify "user_match_predictions should also be deleted" do
      expect(UserMatchPrediction.count).to eq 0
    end

    specify "user_tournament_scores should also be deleted" do
      expect(UserTournamentScore.count).to eq 0
    end
  end

end