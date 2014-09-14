require 'spec_helper'

describe User do

  it { should have_many(:user_round_predictions).dependent(:destroy) }
  it { should have_many(:user_match_predictions).dependent(:destroy) }
  it { should have_many(:user_match_predictions).dependent(:destroy) }

  subject { create(:user) }

  it { should respond_to(:name) }

  it { should be_valid }

end