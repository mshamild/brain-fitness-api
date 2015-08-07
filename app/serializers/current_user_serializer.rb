class CurrentUserSerializer < ApplicationSerializer
  root :user

  attributes :id, :authentication_token, :email, :name
end
