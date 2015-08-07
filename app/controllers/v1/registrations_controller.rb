class V1::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  expose(:user, attributes: :user_attributes)

  def create
    respond_with user.tap(&:save),
      serializer: CurrentUserSerializer
  end

  def update
    current_user.update_attributes user_attributes

    respond_with current_user, serializer: CurrentUserSerializer
  end

  private

  def user_attributes
    params.require(:user).permit(:email, :name, :password)
  end
end
