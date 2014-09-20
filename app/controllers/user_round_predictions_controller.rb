class UserRoundPredictionsController < ApplicationController

  def show
    @urp = UserRoundPrediction.find(params[:user])
  end

  def new
    @urp = UserRoundPrediction.new
  end

  def create
    @urp = UserRoundPrediction.new(urp_params[:urp])
    if @urp.save

    else
      render 'show'
    end
  end

  private

    def urp_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end