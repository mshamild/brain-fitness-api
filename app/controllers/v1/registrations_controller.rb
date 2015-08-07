class V1::RegistrationsController < ApplicationController
  expose(:user, attributes: :user_attributes)

  def create
    respond_with user.tap(&:save),
      serializer: CurrentUserSerializer
  end

  private

  def user_attributes
    params.require(:user).permit(:email, :name, :password)
  end
end
