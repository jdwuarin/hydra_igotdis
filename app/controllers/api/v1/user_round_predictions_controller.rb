class  Api::V1::UserRoundPredictionsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @user_round_predictions = UserRoundPrediction.all

    respond_to do |format|
      format.html { render html: @user_round_predictions }
      format.json { render json: @user_round_predictions }
    end
  end


  def create
    @user_round_predictions = UserRoundPrediction.new(post_params)

    respond_to do |format|
      if @user_round_predictions.save
        format.html { redirect_to @user_round_predictions,
                      notice: 'Prediction was successfully created.' }
        format.json { render json: @user_round_predictions }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_round_predictions.errors,
                      status: :unprocessable_entity }
      end
    end
  end

end