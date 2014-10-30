class UserMatchPredictionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit]

  def index

  end

  def show

  end

  def create

    @ump = UserMatchPrediction.find_or_instantiate_by(
      user_match_prediction_params[:match_id].to_i,
      user_match_prediction_params[:prediction_type].to_i,
      current_user
    )

    @ump[:prediction_type] = user_match_prediction_params[:prediction_type]
    @ump[:comment] = user_match_prediction_params[:comment]
    @ump[:predicted_contestant_id] = 
      user_match_prediction_params[:predicted_contestant_id]

    if @ump.save
      respond_to do |format|
        format.html { redirect_back_or root_path }
        format.js
      end
    else
      puts @ump.errors.full_messages
      respond_to do |format|
        format.html { redirect_back_or root_path }
        format.js { render :text => @ump.errors.to_json,
                    :status => 400 }
      end
    end
  end

  def edit

  end

  private

    def user_match_prediction_params
      params.permit(:match_id, :prediction_type,
                    :predicted_contestant_id, :comment)
    end

end