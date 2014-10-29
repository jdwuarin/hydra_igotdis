class SessionsController < Devise::SessionsController
  def create

    respond_to do |format|
      format.html { super }

      format.json do
        # this line makes sure that the hydra_session cookie
        # is not taken into account when authenticating.
        # which means it is not used for the model(s)
        # using this sessions_controller (i.e. the User one)
        resource = warden.authenticate!(:scope => resource_name,
          :store => !(request.format.xml? || request.format.json?))
        sign_in(resource_name, resource)
        data = {
          user_token: self.resource.authentication_token,
          user_email: self.resource.email
        }
        render json: data, status: 201
      end
    end
  end
end