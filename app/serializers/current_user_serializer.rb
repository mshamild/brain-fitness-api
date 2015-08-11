class CurrentUserSerializer < ApplicationSerializer
  root :user

  attributes :id, :email, :name, :session

  private

  def session
    {
      authentication_token: object.authentication_token,
      expiration_date: 1.day.from_now
    }
  end
end
