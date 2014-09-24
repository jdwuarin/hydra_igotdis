class UserMatchPredictionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit]

  def index

  end

  def show

  end

  def create
    @user_match_prediction = UserMatchPrediction.new(
      :match_id => user_match_prediction_params[:match_id],
      :prediction_type => user_match_prediction_params[:prediction_type],
      :predicted_contestant_id => user_match_prediction_params[:predicted_contestant_id],
      :comment => user_match_prediction_params[:comment],
      :user => current_user)
    if @user_match_prediction.save
      flash[:success] = "Your prediction was successfully saved!"
    end
    redirect_back_or root_path
  end

  def edit

  end

end