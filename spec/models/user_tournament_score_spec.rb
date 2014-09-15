require 'spec_helper'

describe UserTournamentScore do

  before {@uts = create(:user_tournament_score)}

  subject { @uts }

  it { should respond_to(:user) }
  it { should respond_to(:tournament) }
  it { should respond_to(:score) }

  it { should be_valid }

  describe "when user is not present" do
    before { @uts.user = nil }
    it { should_not be_valid }
  end
  describe "when tournament is not present" do
    before { @uts.tournament = nil }
    it { should_not be_valid }
  end
end