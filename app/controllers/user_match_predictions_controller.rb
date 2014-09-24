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
      redirect_back_or root_path
    else
      redirect_to root_url
    end
  end

  def edit

  end

  private

    def user_match_prediction_params
      params.permit(:match_id, :prediction_type,
                    :predicted_contestant_id, :comment)
    end

    def signed_in_user
      unless user_signed_in?
        store_location
        redirect_to new_user_registration_path, notice: "Please sign in."
      end
    end

    def store_location
      user_session[:return_to] = request.url if request.get?
    end

    def redirect_back_or(default)
      redirect_to(user_session[:return_to] || default)
      user_session.delete(:return_to)
    end

    def after_sign_in_path_for
      redirect_to(user_session[:return_to] || root_path)
      user_session.delete(:return_to)
    end

end