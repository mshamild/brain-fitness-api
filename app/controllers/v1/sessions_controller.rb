class V1::SessionsController < Devise::SessionsController
  wrap_parameters :user

  skip_before_action :skip_trackable

  def create
    user = AuthenticateUser.call(warden: warden).user
    respond_with(user, serializer: CurrentUserSerializer)
  end
end
