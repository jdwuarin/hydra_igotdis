class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def create

    respond_to do |format|
      format.html { super }

      format.json do
        # this line makes sure that the hydra_session cookie
        # is not taken into account when authenticating.
        # which means it is not used for the model(s)
        # using this sessions_controller (i.e. the User one)
        self.resource = warden.authenticate!(
          :scope => resource_name,
          :store => false)

        sign_in(resource_name, self.resource)
        data = {
          user_token: self.resource.authentication_token,
          user_email: self.resource.email
        }
        render json: data, status: 201
      end
    end
  end
end