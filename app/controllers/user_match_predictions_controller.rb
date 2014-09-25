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
      # respond_to do |format|
      #   format.html { redirect_back_or root_path }
      #   format.js
      # end
      redirect_back_or root_path
      return
    end
    redirect_to root_path
  end

  def edit

  end

  private

    def user_match_prediction_params
      params.permit(:match_id, :prediction_type,
                    :predicted_contestant_id, :comment)
    end

end