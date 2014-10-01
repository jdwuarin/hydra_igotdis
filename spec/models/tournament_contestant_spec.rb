require 'rails_helper'

describe TournamentContestant do

  before { @tournament_contestant = create(:tournament_contestant)}

  subject { @tournament_contestant }

  it { should respond_to(:tournament) }
  it { should respond_to(:contestant) }
  it { should respond_to(:user_match_predictions) }
  it { should respond_to(:matches_as_receiving_contestant) }
  it { should respond_to(:matches_as_invited_contestant) }

  it { should be_valid }

  describe "when tournament, contestant, contestant_type 
            combination is not unique" do
      before do
        @var_with_same_credentials = @tournament_contestant.dup
        @var_with_same_credentials.group_id = 7
      end

      subject { @var_with_same_credentials }
      it { should_not be_valid }
  end

end