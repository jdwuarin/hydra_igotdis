require 'rails_helper'

describe Match do

  before {@match = create(:match)}

  subject { @match }

  it { should respond_to(:round) }
  it { should respond_to(:date) }
  it { should respond_to(:finished) }
  it { should respond_to(:receiving_contestant) }
  it { should respond_to(:invited_contestant) }
  it { should respond_to(:results) }
  it { should respond_to(:user_match_predictions) }

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
    before do
      @match.invited_contestant.contestant = create(:player)
    end

    it { should_not be_valid }
  end

  describe "when contestants are the same" do
    before do
      @match.invited_contestant.contestant = 
        @match.receiving_contestant.contestant
    end

    it { should_not be_valid }
  end

  describe "when contestants are not participating in the same tournament" do
    before do
      @match.invited_contestant.tournament = create(:tournament)
    end

    it { should_not be_valid }
  end

  describe "when match starts before start of round" do

    before do
      date_before_round = @match.round.start_date - 10.seconds
      @match.date = date_before_round
    end

    it { should_not be_valid }
  end

  describe "LWC specific tests" do

    context "check results validity when match finished" do
      before do
        @match = create(:LWC_group_stage_match)
        @lwc_results_format = ResultsFormat::LWC_RESULTS_FORMAT.clone
        @lwc_results_format['receiving_contestant']["winner"] = true
        @lwc_results_format['invited_contestant']["winner"] = false
        @match.results = @lwc_results_format
        @match.finished = true # mose of these tests apply when match is over

        # this just create for easy later construction
        @contestant_results = @lwc_results_format["receiving_contestant"]
      end

      describe "when lwc_results_format is larger than 3" do
        before do
          @lwc_results_format["random"] = "something"
        end

        it { should_not be_valid }
      end

      # this is the only test to see that any kind of results is valid
      # until the check is done when match is set to finished
      describe "when lwc_results_format is larger than 3 and match not over" do
        before do
          @lwc_results_format["random"] = "something"
          @match.finished = false
        end
        it { should be_valid }
      end

      describe "when 'type' is not present in lwc_results_format" do
        before do
          results = @lwc_results_format.except("type")
          @match.results = results
        end
        it { should_not be_valid }
      end

      describe "when receiving_contestant is not present" do
        before do
          results = @lwc_results_format.except("receiving_contestant")
          @match.results = results
        end
        it { should_not be_valid }
      end

      describe "when invited_contestant is not present" do
        before do
          results = @lwc_results_format.except("invited_contestant")
          @match.results = results
        end
        it { should_not be_valid }
      end

      describe "when winner is absent" do
        before do
          invalid = @contestant_results.except("winner")
          @lwc_results_format["receiving_contestant"] = invalid
        end
        it { should_not be_valid }
      end

      describe "when most_dragon is absent" do
        before do
          invalid = @contestant_results.except("most_dragon")
          @lwc_results_format["receiving_contestant"] = invalid
        end
        it { should_not be_valid }
      end

      describe "when most_first_blood is absent" do
        before do
          invalid = @contestant_results.except("most_first_blood")
          @lwc_results_format["receiving_contestant"] = invalid
        end
        it { should_not be_valid }
      end

      describe "when score is absent" do
        before do
          invalid = @contestant_results.except("score")
          @lwc_results_format["receiving_contestant"] = invalid
        end
        it { should_not be_valid }
      end

      describe "when winner is both true" do
        before do
          @lwc_results_format["receiving_contestant"]["winner"] = true
          @lwc_results_format["invited_contestant"]["winner"] = true
        end
        it { should_not be_valid }
      end

      describe "when winner is both false" do
        before do
          @lwc_results_format["receiving_contestant"]["winner"] = false
          @lwc_results_format["invited_contestant"]["winner"] = false
        end
        it { should_not be_valid }
      end

      describe "when receiving_contestant winner is nil" do
        before do
          @lwc_results_format["receiving_contestant"]["winner"] = nil
        end
        it { should_not be_valid }
      end

      describe "when invited_contestant winner is nil" do
        before do
          @lwc_results_format["invited_contestant"]["winner"] = nil
        end
        it { should_not be_valid }
      end

      describe "when match.round_type is GROUP_STAGE" do

        before do
          @match.round.round_type = RoundTypes::GROUP_STAGE
          @match.round.is_direct_elimination_round = false
        end

        # by default, it should be valid as is
        it { should be_valid }

      end

      describe "when match.round_type is QUARTER_FINALS" do

        before do
          @match.round.round_type = RoundTypes::QUARTER_FINALS
          @match.round.is_direct_elimination_round = true
        end

        # by default, as is, it should not be valid
        it { should_not be_valid }

        describe "when score is both same" do
          before do
            @lwc_results_format["receiving_contestant"]["score"] = 3
            @lwc_results_format["invited_contestant"]["score"] = 3
          end
          it { should_not be_valid }
        end

        describe "when a score is above LWC_MAX_QUARTER_FINAL_SCORE" do
          before do
            invalid = ResultsFormat::LWC_MAX_QUARTER_FINAL_SCORE + 1
            @lwc_results_format["receiving_contestant"]["score"] = invalid
            @lwc_results_format["invited_contestant"]["score"] = 1
          end
          it { should_not be_valid }
        end

        describe "when a score is below 0" do
          before do
            @lwc_results_format["receiving_contestant"]["score"] = -1
            @lwc_results_format["invited_contestant"]["score"] = 1
          end
          it { should_not be_valid }
        end

        describe "when score is incomplete" do
          before do
            @lwc_results_format["receiving_contestant"]["score"] = 1
            @lwc_results_format["invited_contestant"]["score"] = 0
          end
          it { should_not be_valid }
        end

        describe "when a score is nil" do
          before do
            @lwc_results_format["invited_contestant"]["score"] = nil
          end
          it { should_not be_valid }
        end

        describe "when score is not in accordance with WINNER side" do
          before do
            @lwc_results_format["receiving_contestant"]["score"] = 0
            @lwc_results_format["invited_contestant"]["score"] = 3
          end
          it { should_not be_valid }
        end

        describe "when score is alright" do
          before do
            @lwc_results_format["receiving_contestant"]["score"] = 3
            @lwc_results_format["invited_contestant"]["score"] = 0
          end
          it { should be_valid }
        end

      end

      describe "when match.round_type is SEMI_FINALS" do

        before do
          @lwc_results_format["receiving_contestant"]["score"] = 3
          @lwc_results_format["invited_contestant"]["score"] = 1
          @match.round.round_type = RoundTypes::SEMI_FINALS
          @match.round.is_direct_elimination_round = true
        end

        # by default, as is, it should not be valid
        it { should_not be_valid }

        describe "when a score is above LWC_MAX_OTHER_SCORE" do
          before do
            invalid = ResultsFormat::LWC_MAX_OTHER_SCORE + 1
            @lwc_results_format["receiving_contestant"]["score"] = invalid
            @lwc_results_format["invited_contestant"]["score"] = 1
          end
          it { should_not be_valid }
        end

        describe "when score is incomplete" do
          before do
            @lwc_results_format["receiving_contestant"]["score"] = 2
            @lwc_results_format["invited_contestant"]["score"] = 0
          end
          it { should_not be_valid }
        end

        describe "when most_first_blood is both true" do
          before do
            @lwc_results_format["receiving_contestant"][
              "most_first_blood"] = true
            @lwc_results_format["invited_contestant"][
              "most_first_blood"] = true
          end
          it { should_not be_valid }
        end

        describe "when most_first_blood is both false" do
          before do
            @lwc_results_format["receiving_contestant"][
              "most_first_blood"] = false
            @lwc_results_format["invited_contestant"][
              "most_first_blood"] = false
          end
          it { should_not be_valid }
        end

        describe "when receiving_contestant most_first_blood is nil" do
          before do
            @lwc_results_format["receiving_contestant"][
              "most_first_blood"] = nil
          end
          it { should_not be_valid }
        end

        describe "when invited_contestant most_first_blood is nil" do
          before do
            @lwc_results_format["invited_contestant"][
              "most_first_blood"] = nil
          end
          it { should_not be_valid }
        end

        describe "when most_first_blood is good" do
          before do
            @lwc_results_format["receiving_contestant"][
              "most_first_blood"] = false
            @lwc_results_format["invited_contestant"][
              "most_first_blood"] = true
          end
          it { should be_valid }
        end

      end

      describe "when match.round_type is FINAL" do

        before do
          @lwc_results_format["receiving_contestant"]["score"] = 3
          @lwc_results_format["invited_contestant"]["score"] = 1
          @lwc_results_format["receiving_contestant"][
            "most_first_blood"] = false
          @lwc_results_format["invited_contestant"][
            "most_first_blood"] = true
          @match.round.round_type = RoundTypes::FINAL
          @match.round.is_direct_elimination_round = true
        end

        # by default, as is, it should not be valid
        it { should_not be_valid }

        describe "when most_dragon is both true" do
          before do
            @lwc_results_format["receiving_contestant"]["most_dragon"] = true
            @lwc_results_format["invited_contestant"]["most_dragon"] = true
          end
          it { should_not be_valid }
        end

        describe "when most_dragon is both false" do
          before do
            @lwc_results_format["receiving_contestant"]["most_dragon"] = false
            @lwc_results_format["invited_contestant"]["most_dragon"] = false
          end
          it { should_not be_valid }
        end

        describe "when receiving_contestant most_dragon is nil" do
          before do
            @lwc_results_format["receiving_contestant"]["most_dragon"] = nil
          end
          it { should_not be_valid }
        end

        describe "when invited_contestant most_dragon is nil" do
          before do
            @lwc_results_format["invited_contestant"]["most_dragon"] = nil
          end
          it { should_not be_valid }
        end

        describe "when most_dragon is good" do
          before do
            @lwc_results_format["receiving_contestant"]["most_dragon"] = false
            @lwc_results_format["invited_contestant"]["most_dragon"] = true
          end
          it { should be_valid }
        end

      end

    end

    context "concerning point distribution" do

      before do

        @user = create(:user)

        @match = create(:LWC_group_stage_match)
        travel_to(@match.date-1.hour)
        @lwc_results_format = ResultsFormat::LWC_RESULTS_FORMAT
        @lwc_results_format['receiving_contestant']["winner"] = true
        @lwc_results_format['invited_contestant']["winner"] = false
        @match.results = @lwc_results_format
        @match.finished = true # mose of these tests apply when match is over

      end

      context "match is a GROUP_STAGE match" do

        before do
          @match.round.round_type = RoundTypes::GROUP_STAGE

          # this is a good prediction for round 1
          @user_match_prediction = create(:user_match_prediction,
            match: @match,
            predicted_contestant: @match.receiving_contestant,
            prediction_type: PredictionTypes::WINNER,
            user: @user)

        end

        context "@user correctly predicted the winner" do

          before { @match.save }
          # this is the case by default

          specify "user should now have an account with 100 points in it" do
            user_tournament_score = UserTournamentScore.find_by(user: @user,
              tournament: @match.round.tournament)
            expect(user_tournament_score.score).to eq 100
          end

        end

        context "multiple users correctly predicted the winner" do

          before do

            @users = create_list(:user, 5)

            @users.each do |user|
              create(:user_match_prediction,
                match: @match,
                predicted_contestant: @match.receiving_contestant,
                prediction_type: PredictionTypes::WINNER,
                user: user)
            end
            @match.save
          end

          specify "users should now have an account with 100 points in it" do

            @users.each do |user|
              user_tournament_score = UserTournamentScore.find_by(user: user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 100
            end
          end

        end

        context "@user incorrectly predicted the winner" do

          before do
            @user_match_prediction.predicted_contestant = @match.invited_contestant
            @user_match_prediction.save
            @match.save
          end

          specify "user should now have an account with 0 points in it" do
            user_tournament_score = UserTournamentScore.find_by(user: @user,
              tournament: @match.round.tournament)
            expect(user_tournament_score.score).to eq 0
          end

        end

        context "some users correctly predicted the winner others didn't" do

          before do

            @good_users = create_list(:user, 15)
            @bad_users = create_list(:user, 20)

            @good_users.each do |user|
              create(:user_match_prediction,
                match: @match,
                predicted_contestant: @match.receiving_contestant,
                prediction_type: PredictionTypes::WINNER,
                user: user)
            end
            @bad_users.each do |user|
              create(:user_match_prediction,
                match: @match,
                predicted_contestant: @match.invited_contestant,
                prediction_type: PredictionTypes::WINNER,
                user: user)
            end

            @match.save
          end

          specify "points should now be porperly distributed" do

            @good_users.each do |user|
              user_tournament_score = UserTournamentScore.find_by(user: user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 100
            end
            @bad_users.each do |user|
              user_tournament_score = UserTournamentScore.find_by(user: user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 0
            end

          end

        end

      end

      context "match is a QUARTER_FINALS match" do

        before do
          @match.round.round_type = RoundTypes::QUARTER_FINALS
          @lwc_results_format['receiving_contestant']["score"] = 3
          @lwc_results_format['invited_contestant']["score"] = 2
          @match.results = @lwc_results_format
        end

        describe "where user made a winner prediction" do

          before do
            # this is a good prediction for QUARTER_FINALS
            @user_match_prediction = create(:user_match_prediction,
              match: @match,
              predicted_contestant: @match.receiving_contestant,
              prediction_type: PredictionTypes::WINNER,
              user: @user)
          end

          context "@user correctly predicted the winner" do

            before { @match.save }

            # this is the case by default

            specify "user should now have an account with 300 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 300
            end

          end

        end

        describe "where user made a score prediction" do

          before do
            # this is a good prediction for QUARTER_FINALS
            @user_match_prediction = create(:user_match_prediction,
              match: @match,
              predicted_contestant: @match.receiving_contestant,
              prediction_type: PredictionTypes::SCORE_3_2,
              user: @user)
          end

          context "@user correctly predicted the score" do

            before { @match.save }
            # this is the case by default

            specify "user should now have an account with 300 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 300
            end

          end

          context "@user incorrectly predicted the score by direction" do
            before do
              @user_match_prediction.predicted_contestant = @match.invited_contestant
              @user_match_prediction.save
              @match.save
            end

            specify "user should now have an account with 0 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 0
            end
          end

          context "@user incorrectly predicted the score by value" do
            before do
              @user_match_prediction.prediction_type = PredictionTypes::SCORE_3_1
              @user_match_prediction.save
              @match.save
            end

            specify "user should now have an account with 0 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 0
            end
          end

        end

      end

      context "match is a SEMI_FINALS match" do

        before do
          @match.round.round_type = RoundTypes::SEMI_FINALS
          @lwc_results_format['receiving_contestant']["score"] = 3
          @lwc_results_format['invited_contestant']["score"] = 1
          @lwc_results_format['receiving_contestant']["most_first_blood"] = false
          @lwc_results_format['invited_contestant']["most_first_blood"] = true
          @match.results = @lwc_results_format
        end

        describe "where user made a winner prediction" do

          before do
            # this is a good prediction for SEMI_FINALS
            @user_match_prediction = create(:user_match_prediction,
              match: @match,
              predicted_contestant: @match.receiving_contestant,
              prediction_type: PredictionTypes::WINNER,
              user: @user)
          end

          context "@user correctly predicted the winner" do

            before { @match.save }
            # this is the case by default

            specify "user should now have an account with 600 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 600
            end

          end

        end

        describe "where user made a score prediction" do

          before do
            # this is a good prediction for SEMI_FINALS
            @user_match_prediction = create(:user_match_prediction,
              match: @match,
              predicted_contestant: @match.receiving_contestant,
              prediction_type: PredictionTypes::SCORE_3_1,
              user: @user)
          end

          context "@user correctly predicted the score" do

            before { @match.save }
            # this is the case by default

            specify "user should now have an account with 600 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 600
            end

          end

          context "@user incorrectly predicted the score by direction" do
            before do
              @user_match_prediction.predicted_contestant = @match.invited_contestant
              @user_match_prediction.save
              @match.save
            end

            specify "user should now have an account with 0 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 0
            end
          end

          context "@user incorrectly predicted the score by value" do
            before do
              @user_match_prediction.prediction_type = PredictionTypes::SCORE_3_0
              @user_match_prediction.save
              @match.save
            end

            specify "user should now have an account with 0 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 0
            end
          end

        end

        describe "where user made a most_first_blood prediction" do

          before do
            # this is a good prediction for SEMI_FINALS
          @user_match_prediction = create(:user_match_prediction,
            match: @match,
            predicted_contestant: @match.invited_contestant,
            prediction_type: PredictionTypes::MOSTFIRSTBLOOD,
            user: @user)
          end

          context "@user correctly predicted most_first_blood" do

            before { @match.save }
            # this is the case by default

            specify "user should now have an account with 600 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 600
            end

          end

          context "@user incorrectly predicted most_first_blood" do
            before do
              @user_match_prediction.predicted_contestant = @match.receiving_contestant
              @user_match_prediction.save
              @match.save
            end

            specify "user should now have an account with 0 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 0
            end
          end

        end

      end

      context "match is the FINAL match" do

        before do
          @match.round.round_type = RoundTypes::FINAL
          @lwc_results_format['receiving_contestant']["winner"] = false
          @lwc_results_format['invited_contestant']["winner"] = true
          @lwc_results_format['receiving_contestant']["score"] = 0
          @lwc_results_format['invited_contestant']["score"] = 3
          @lwc_results_format['receiving_contestant']["most_first_blood"] = true
          @lwc_results_format['invited_contestant']["most_first_blood"] = false
          @lwc_results_format['receiving_contestant']["most_dragon"] = false
          @lwc_results_format['invited_contestant']["most_dragon"] = true
          @match.results = @lwc_results_format
        end

        describe "where user made a winner prediction" do

          before do
            # this is a good prediction for the FINAL
            @user_match_prediction = create(:user_match_prediction,
              match: @match,
              predicted_contestant: @match.invited_contestant,
              prediction_type: PredictionTypes::WINNER,
              user: @user)
          end

          context "@user correctly predicted the winner" do

            before { @match.save }

            # this is the case by default

            specify "user should now have an account with 900 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 900
            end

          end

        end

        describe "where user made a score prediction" do

          before do
            # this is a good prediction for FINAL
            @user_match_prediction = create(:user_match_prediction,
              match: @match,
              predicted_contestant: @match.invited_contestant,
              prediction_type: PredictionTypes::SCORE_3_0,
              user: @user)
          end

          context "@user correctly predicted the score" do

            before { @match.save }
            # this is the case by default

            specify "user should now have an account with 900 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 900
            end

          end

        end

        describe "where user made a most_first_blood prediction" do

          before do
            # this is a good prediction for the FINAL
          @user_match_prediction = create(:user_match_prediction,
            match: @match,
            predicted_contestant: @match.receiving_contestant,
            prediction_type: PredictionTypes::MOSTFIRSTBLOOD,
            user: @user)
          end

          context "@user correctly predicted most_first_blood" do

            before { @match.save }
            # this is the case by default

            specify "user should now have an account with 900 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 900
            end

          end

          context "@user incorrectly predicted most_first_blood" do
            before do
              @user_match_prediction.predicted_contestant = @match.invited_contestant
              @user_match_prediction.save
              @match.save
            end

            specify "user should now have an account with 0 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 0
            end
          end

        end

        describe "where user made a most_dragon prediction" do

          before do
            # this is a good prediction for the FINAL
          @user_match_prediction = create(:user_match_prediction,
            match: @match,
            predicted_contestant: @match.invited_contestant,
            prediction_type: PredictionTypes::MOSTDRAGON,
            user: @user)
          end

          context "@user correctly predicted most_dragon" do

            before { @match.save }
            # this is the case by default

            specify "user should now have an account with 900 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 900
            end

          end

          context "@user incorrectly predicted most_dragon" do
            before do
              @user_match_prediction.predicted_contestant = @match.receiving_contestant
              @user_match_prediction.save
              @match.save
            end

            specify "user should now have an account with 0 points in it" do
              user_tournament_score = UserTournamentScore.find_by(user: @user,
                tournament: @match.round.tournament)
              expect(user_tournament_score.score).to eq 0
            end
          end

        end

      end

    end

  end

end



