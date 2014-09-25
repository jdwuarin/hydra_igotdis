require 'spec_helper'

describe UserMatchPrediction do

  before {@user_match_prediction = create(:user_match_prediction)}

  subject { @user_match_prediction }

  it { should respond_to(:match) }
  it { should respond_to(:user) }
  it { should respond_to(:prediction_type) }
  it { should respond_to(:predicted_contestant) }

  it { should be_valid }

  describe "when match is not present" do
    before { @user_match_prediction.match = nil }
    it { should_not be_valid }
  end

  describe "when prediction_type is not present" do
    before { @user_match_prediction.prediction_type = " " }
    it { should_not be_valid }
  end

  describe "when predicted_contestant is not present" do
    before { @user_match_prediction.predicted_contestant = nil }
    it { should_not be_valid }
  end

  describe "when user is not present" do
    before { @user_match_prediction.user = nil }
    it { should_not be_valid }
  end

  describe "when match has already started" do
    before do
      match = @user_match_prediction.match
      match.date = DateTime.now - 10.seconds
      match.save
    end

    it { should_not be_valid }
  end

  describe "when predicted contestant did not participate in match" do

    before do
      other_contestant = create(:tournament_contestant)
      @user_match_prediction.predicted_contestant = other_contestant
    end
    it { should_not be_valid }

  end

  describe "when user has already done a prediction of one type on match" do

    context "with identical prediction_type" do
      before do
        @same_prediction = build(:user_match_prediction,
                                 match: @user_match_prediction.match,
                                 user: @user_match_prediction.user)
      end
      subject { @same_prediction }
      it { should_not be_valid}
    end

    context "with different prediction_type" do
      before do
        @same_prediction = create(:user_match_prediction,
          match: @user_match_prediction.match,
          user: @user_match_prediction.user,
          prediction_type: PredictionTypes::MOSTFIRSTBLOOD)
      end
      subject { @same_prediction }
      it { should be_valid}
    end
  end

  describe "LWC specific tests" do

    before { @user_match_prediction = create(:LWC_user_match_prediction) }

    describe "when user predicts a draw" do
      before do
        @user_match_prediction.prediction_type = PredictionTypes::Draw
      end
        # tournament does not have draws
        it { should_not be_valid}
    end

    describe "when user does a prediction on a match of GROUP_STAGE" do

      before do
        @user_match_prediction.match = create(:LWC_group_stage_match)
      end

      context "and prediction type is different than WINNER" do
        before do 
          @user_match_prediction.prediction_type = Prediction_Type::SCORE_2_0
        end
          # can only do predictions on winner of group_stage match
          it { should_not be_valid}
      end

      context "and prediction type is WINNER" do
        before do 
          @user_match_prediction.prediction_type = Prediction_Type::WINNER
        end
          it { should be_valid}
      end

    end

    describe "when user does a prediction on a match of quarter final" do

      before do
        @user_match_prediction.match = create(:LWC_quarter_final_match)
      end

      context "and prediction type is not available in LWC_QUARTER_FINAL" do
        before do 
          @user_match_prediction.prediction_type = Prediction_Type::SCORE_3_0
        end
          it { should_not be_valid}
      end

      context "and prediction type is available in LWC_QUARTER_FINAL" do
        before do 
          @user_match_prediction.prediction_type = Prediction_Type::SCORE_2_0
        end
          it { should be_valid}
      end

    end

    describe "when user does a prediction on a match of semi final" do

      before do
        @user_match_prediction.match = create(:LWC_semi_final_match)
      end

      context "and prediction type is not available in LWC_SEMI_FINAL" do
        before do 
          @user_match_prediction.prediction_type = Prediction_Type::MOSTDRAGON
        end
          it { should_not be_valid}
      end

      context "and prediction type is available in LWC_SEMI_FINAL" do
        before do 
          @user_match_prediction.prediction_type = Prediction_Type::MOSTFIRSTBLOOD
        end
          it { should be_valid}
      end

    end

    describe "when user does a prediction on the final" do

      before do
        @user_match_prediction.match = create(:LWC_final_match)
      end

      context "and prediction type is not available in LWC_FINAL" do
        before do 
          @user_match_prediction.prediction_type = Prediction_Type::SCORE_2_1
        end
          it { should_not be_valid}
      end

      context "and prediction type is available in LWC_QUARTER_FINAL" do
        before do 
          @user_match_prediction.prediction_type = Prediction_Type::MOSTDRAGON
        end
          it { should be_valid}
      end

    end


  end

end