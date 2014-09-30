class UsersController < ApplicationController
  before_action :correct_user, only: [:update, :finish_signup]


  # PATCH/PUT /users/:id.:format
  def update

    respond_to do |format|
      if current_user.update(user_params)
        sign_in(current_user, :bypass => true)
        format.html { redirect_back_or root_path }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup

    if request.patch? && params[:user] #&& params[:user][:email]
      if current_user.update(user_params)
        sign_in(current_user, :bypass => true)
        redirect_back_or root_path
      else
        @show_errors = true
      end
    end
  end

  private

    def user_params
      accessible = [ :username, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end

end