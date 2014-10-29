class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user_from_token!

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

          byebug
          # please not that the authenticate_with_http_token only goes
          # through if there is a :login and :password parameters in the
          # request.params["user"]. Otherwise (if the user is not trying)
          # to authenticate onseself, nothing is done.
          authenticate_with_http_token do |token, options|

            user_login = options[:user_login].presence
            user       = user_login && (User.find_by(:email => user_login) ||
                                        User.find_by(:username => user_login))

            if user && Devise.secure_compare(user.authentication_token, token)
              sign_in user, store: false
            end
          end
        end
      end
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

      require 'addressable/uri'
      uri = Addressable::URI.parse(request.url)

      query_values = uri.query_values
      if query_values
        query_values.delete('user_id')
        uri.query_values = query_values
      end

      session[:return_to] = uri.to_s if request.get?
    end

    def redirect_back_or(default, flash_messages={})
      redirect_to(session[:return_to] || default, 
        :flash => flash_messages,
        :params => params.delete(:user_id))
      session.delete(:return_to)
    end

    def after_sign_in_path_for(resource)
      if resource.class == AdminUser
        return admin_root_path
      end

      if resource.username
        session[:return_to] || root_path
      else
        finish_signup_path(resource)
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