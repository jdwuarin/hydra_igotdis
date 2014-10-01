class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :ensure_signup_complete, except: :destroy

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  private

    def user_match_prediction_params
      params.permit(:match_id, :prediction_type,
                    :predicted_contestant_id, :comment)
    end

    def signed_in_user
      unless user_signed_in?
        store_location
        redirect_to new_user_registration_path, notice: "Please sign up."
      end
    end

    def store_location
      session[:return_to] = request.url if request.get?
    end

    def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end

    def current_user?(user)
      user == current_user
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def ensure_signup_complete
      # Ensure we don't go into an infinite loop
      puts action_name
      return if action_name == 'finish_signup'

      # Redirect to the 'finish_signup' page if the user
      # email hasn't been verified yet
      if current_user && !current_user.username
        redirect_to finish_signup_path(current_user)
      end
    end

end