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

  describe "when tournament, user, combination is not unique" do
      before do
        @var_with_same_credentials = @uts.dup
        @var_with_same_credentials.score = 1000000
      end

      subject { @var_with_same_credentials }
      it { should_not be_valid }
  end

end