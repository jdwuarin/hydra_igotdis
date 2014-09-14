require 'spec_helper'

describe User do

  it { should have_many(:user_round_predictions).dependent(:destroy) }
  it { should have_many(:user_match_predictions).dependent(:destroy) }
  it { should have_many(:user_tournament_scores).dependent(:destroy) }

  before {@user = create(:user)}
  subject { @user }

  it { should respond_to(:email) }

  it { should be_valid }

end