require 'spec_helper'

describe User do

  before { @user = create(:user) }
  subject { @user }

  it { should respond_to(:email) }

  it { should be_valid }

  describe "When user has some user_round_predictions" do

    before do
      @urp = create(:user_round_prediction, user: @user)
      @user.destroy
    end

    subject { @urp }
    specify "They should be destroyed upon user destruction" do 
      puts @urp
    end

  end


  # it { should have_many(:user_round_predictions).dependent(:destroy) }
  # it { should have_many(:user_match_predictions).dependent(:destroy) }
  # it { should have_many(:user_tournament_scores).dependent(:destroy) }

end