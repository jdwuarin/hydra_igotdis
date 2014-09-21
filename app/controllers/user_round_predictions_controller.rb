class UserRoundPredictionsController < ApplicationController

  def show
    @user_round_prediction = UserRoundPrediction.find(params[:user])
  end

  def new
    @user_round_prediction = UserRoundPrediction.new
  end

  def create
    @user_round_prediction = UserRoundPrediction.new(urp_params)
    if @user_round_prediction.save

    else
      render 'show'
    end
  end

  private

    def urp_params
      user_round_prediction_params.require(
        :user_round_prediction).permit(
        :round, :prediction_type, :predicted_contestant_id, :password_confirmation)
    end

end