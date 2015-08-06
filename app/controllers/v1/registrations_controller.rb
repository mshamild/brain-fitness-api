class V1::RegistrationsController < ApplicationController
  expose(:user, attributes: :user)

  def create
    respond_with user.tap(&:save)
  end

  private

  def user_attributes
    params.require(:user).permit(:email, :name, :password)
  end
end
