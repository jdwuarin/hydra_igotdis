class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  serialization_scope :view_context

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user_from_token!
  before_action :signed_in_user

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end

  private

    def authenticate_user_from_token!

      respond_to do |format|

        # this is only used when request format is json
        # i.e. for the admin part of the app, this is not entered

        format.html { return }

        format.json do

          # the authenticate_with_http_token method will either:
          # 1) Call create on the sessions_controller if
          #    the request was made with a :login and :password parameters in the
          #    request.params["user"]
          # 2) Authenticate with user with the token if the user is sending
          #    over a token in the request header of the request
          # 3) Exit silently if no such params are passed on over
          authenticate_with_http_token do |token, options|

            user_email = options[:user_email].presence
            user       = user_email && (User.find_by(:email => user_email))

            if user && Devise.secure_compare(user.authentication_token, token)
              sign_in user, store: false
            end
          end
        end
      end
    end

    def user_match_prediction_params
      params.permit(:match_id, :prediction_type,
                    :predicted_contestant_id, :comment)
    end

    def signed_in_user
      byebug
      unless user_signed_in?
        # redirect_to new_user_registration_path, notice: "Please sign up."
      end
    end

    def current_user?(user)
      user == current_user
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end