require 'spec_helper'
require 'spec_shared_context'

describe Match do

  include_context "instance_variables"

  subject { @match }

  it { should respond_to(:round) }
  it { should respond_to(:date) }
  it { should respond_to(:finished) }
  it { should respond_to(:receiving_contestant) }
  it { should respond_to(:invited_contestant) }
  it { should respond_to(:results) }

  it { should be_valid }

  describe "when round is not present" do
    before { @match.round = nil }
    it { should_not be_valid }
  end

  describe "when date is not present" do
    before { @match.date = nil }
    it { should_not be_valid }
  end

  describe "when receiving_contestant is not present" do
    before { @match.receiving_contestant = nil }
    it { should_not be_valid }
  end

  describe "when invited_contestant is not present" do
    before { @match.invited_contestant = nil }
    it { should_not be_valid }
  end

  describe "when contestant types do not match" do
    before { @match.invited_contestant = @player_1 }
    it { should_not be_valid }
  end

  describe "round and match contestants same when is direct elimination" do
    before do
      @round.is_direct_elimination_round = true
      @round.save
      wrong_team = Team.new(name: "Wrong team",
                            continent_id: 1,
                            game_id: 1)
      @match.receiving_contestant = wrong_team
      @match.save
    end
    it { should_not be_valid }

  end

  describe "when round is not direct elimination, no such check" do
    before do
      @round.is_direct_elimination_round = false
      @round.save
      some_team = Team.new(name: "Some team",
                            continent_id: 1,
                            game_id: 1)
      @match.receiving_contestant = some_team
      @match.save
    end
    it { should be_valid }

  end

  describe "when contestants are the same" do
    before { @match.invited_contestant = @team_1 }
    it { should_not be_valid }
  end

  describe "when start of match starts before start of round" do
    date_before_tournament = @round.start_date - 1
    before { @match.date = date_before_tournament }
    it { should_not be_valid }
  end

  describe "Test validity of LOL_results_format_1 when match finished" do

    before do
      @contestant_results = @lol_results_format_1["receiving_contestant"].clone
      @contestant_results["winner"] = nil
      @match.finished = true # all these tests only apply when match is over
    end

    describe "when lol_results_format_1 is larger than 3" do
      before do
        @lol_results_format_1["random"] = "something"
        @match.results = @lol_results_format_1
        @match.save
      end
      it {should_not be_valid}
    end

    # this is the only test to see that any kind of results is valid
    # until the check is done when match is set to finished
    describe "when lol_results_format_1 is larger than 3 and match not over" do
      before do
        @lol_results_format_1["random"] = "something"
        @match.results = @lol_results_format_1
        @match.finished = false
        @match.save
      end
      it {should be_valid}
    end

    describe "when 'type' is not present in lol_results_format_1" do
      before do
        results = @lol_results_format_1.except("type")
        @match.results = results
        @match.save
      end
      it {should_not be_valid}
    end

    descibe "when receiving_contestant is not present" do
      before do
        results = @lol_results_format_1.except("receiving_contestant")
        @match.results = results
        @match.save
      end
      it {should_not be_valid}
    end

    describe "when invited_contestant is not present" do
      before do
        results = @lol_results_format_1.except("invited_contestant")
        @match.results = results
        @match.save
      end
      it {should_not be_valid}
    end

    describe "when winner is absent" do
      before do
        invalid = @contestant_results.except("winner")
        @lol_results_format_1["receiving_contestant"] = invalid
      end
      it {should_not be_valid}
    end

    describe "when first_blood is absent" do
      before do
        invalid = @contestant_results.except("first_blood")
        @lol_results_format_1["receiving_contestant"] = invalid
      end
      it {should_not be_valid}
    end

    describe "when first_tower is absent" do
      before do
        invalid = @contestant_results.except("first_tower")
        @lol_results_format_1["receiving_contestant"] = invalid
      end
      it {should_not be_valid}
    end

    describe "when first_inhibitor is absent" do
      before do
        invalid = @contestant_results.except("first_inhibitor")
        @lol_results_format_1["receiving_contestant"] = invalid
      end
      it {should_not be_valid}
    end

    describe "when winner is both true" do
      before do
        @lol_results_format_1["receiving_contestant"]["winner"] = true
        @lol_results_format_1["invited_contestant"]["winner"] = true
      end
      it {should_not be_valid}
    end

    describe "when winner is both false" do
      before do
        @lol_results_format_1["receiving_contestant"]["winner"] = false
        @lol_results_format_1["invited_contestant"]["winner"] = false
      end
      it {should_not be_valid}
    end

    describe "when receiving_contestant winner is nil" do
      before do
        @lol_results_format_1["receiving_contestant"]["winner"] = nil
      end
      it {should_not be_valid}
    end

    describe "when invited_contestant winner is nil" do
      before do
        @lol_results_format_1["invited_contestant"]["winner"] = nil
      end
      it {should_not be_valid}
    end

    describe "when winner status is all good" do
      it {should be_valid}
    end

    describe "when match.round_type is 1" do

      before do
        @round.round_type = 1
        @round.is_direct_elimination_round = false
        @round.save
      end

      describe "when first_blood is absent" do
        #by default it is
        it {should be_valid}
      end

      describe "when first_tower is absent" do
        #by default it is
        it {should be_valid}
      end

      describe "when first_inhibitor is absent" do
        #by default it is
        it {should be_valid}
      end

    end

    describe "when match.round_type is 2" do

      before do
        @round.round_type = 2
        @round.is_direct_elimination_round = true
        @round.save
      end

      describe "when first_blood is absent" do
        #by default it is
        it {should be_valid}
      end

      describe "when first_tower is absent" do
        #by default it is
        it {should be_valid}
      end

      describe "when first_inhibitor is absent" do
        #by default it is
        it {should be_valid}
      end

    end

    describe "when match.round_type is 3" do

      before do
        @round.round_type = 3
        @round.is_direct_elimination_round = true
        @round.save
      end

      describe "when first_blood is absent" do
        #by default it is
        it {should_not be_valid}
      end

      describe "when first_blood is both true" do
        before do
          @lol_results_format_1["receiving_contestant"]["first_blood"] = true
          @lol_results_format_1["invited_contestant"]["first_blood"] = true
        end
        it {should_not be_valid}
      end

      describe "when first_blood is both false" do
        before do
          @lol_results_format_1["receiving_contestant"]["first_blood"] = false
          @lol_results_format_1["invited_contestant"]["first_blood"] = false
        end
        it {should_not be_valid}
      end

      describe "when receiving_contestant first_blood is nil" do
        before do
          @lol_results_format_1["receiving_contestant"]["first_blood"] = nil
        end
        it {should_not be_valid}
      end

      describe "when invited_contestant first_blood is nil" do
        before do
          @lol_results_format_1["invited_contestant"]["first_blood"] = nil
        end
        it {should_not be_valid}
      end

      describe "when first_tower is absent" do
        #by default it is
        it {should be_valid}
      end

      describe "when first_inhibitor is absent" do
        #by default it is
        it {should be_valid}
      end

    end

    describe "when match.round_type is 3" do

      before do
        @round.round_type = 4
        @round.is_direct_elimination_round = true
        @round.save
      end

      describe "when first_blood is absent" do
        #by default it is
        it {should_not be_valid}
      end

      describe "when first_tower is absent" do
        #by default it is
        it {should_not be_valid}
      end

      describe "when first_inhibitor is absent" do
        #by default it is
        it {should_not be_valid}
      end

      result_specs = ["first_blood", "first_tower", "first_inhibitor"]

      result_specs.each do |result_spec|

        describe format("when %{a} is both true", a: result_spec) do
          before do
            @lol_results_format_1["receiving_contestant"]["first_blood"] = true
            @lol_results_format_1["invited_contestant"]["first_blood"] = true
          end
          it {should_not be_valid}
        end

        describe format("when %{a} is both false", a: result_spec) do
          before do
            @lol_results_format_1["receiving_contestant"]["first_blood"] = false
            @lol_results_format_1["invited_contestant"]["first_blood"] = false
          end
          it {should_not be_valid}
        end

        describe format("when receiving_contestant %{a} nil", a: result_spec) do
          before do
            @lol_results_format_1["receiving_contestant"]["first_blood"] = nil
          end
          it {should_not be_valid}
        end

        describe format("when invited_contestant %{a} nil", a: result_spec) do
          before do
            @lol_results_format_1["invited_contestant"]["first_blood"] = nil
          end
          it {should_not be_valid}
        end

      end
    end
  end

  describe "Test distributing points when matches are over" do

    context "match is a round 1 match" do

      before do
        @round.round_type = 1
      end

      context "@user correctly predicted the winner" do

      end

      context "multiple users correctly predicted the winner" do

      end

      context "@user incorrectly predicted the winner" do

      end

      context "one user correctly predicted the winner other didn't" do

      end

      context "multiple users incorrectly predicted the winner" do

      end

    end

    context "match is a round 2 match" do

      before do
        @round.round_type = 2
      end

      context "@user correctly predicted the winner" do

      end

      context "@user incorrectly predicted the winner" do

      end

    end

    context "match is a round 3 match" do

      before do
        @round.round_type = 3
      end

      context "@user correctly predicted the winner" do

      end

      context "@user incorrectly predicted the winner" do

      end

      context "@user correctly predicted the first_blood" do

      end

      context "multiple users correctly predicted the first_blood" do

      end

      context "@user incorrectly predicted the first_blood" do

      end

      context "one user correctly predicted the first_blood other didn't" do

      end

      context "multiple users incorrectly predicted the first_blood" do

      end

    end

    context "match is a round 4 match" do

      before do
        @round.round_type = 4
      end

      context "@user correctly predicted the winner" do

      end

      context "@user incorrectly predicted the winner" do

      end

      context "@user correctly predicted the first_blood" do

      end

      context "@user incorrectly predicted the first_blood" do

      end

      context "@user correctly predicted the first_tower" do

      end

      context "multiple users correctly predicted the first_tower" do

      end

      context "@user incorrectly predicted the first_tower" do

      end

      context "one user correctly predicted the first_tower other didn't" do

      end

      context "multiple users incorrectly predicted the first_tower" do

      end

      context "@user correctly predicted the first_inhibitor" do

      end

      context "multiple users correctly predicted the first_inhibitor" do

      end

      context "@user incorrectly predicted the first_inhibitor" do

      end

      context "one user correctly predicted the first_inhibitor other didn't" do

      end

      context "multiple users incorrectly predicted the first_inhibitor" do

      end


    end

  end

end



