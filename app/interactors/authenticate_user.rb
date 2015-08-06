class AuthenticateUser
  include Interactor

  OPTIONS = { store: false, scope: :user }

  def call
    context[:user] = authenticated_user
  end

  private

  delegate :warden, to: :context

  def authenticated_user
    warden
      .authenticate!(OPTIONS)
      .tap(&:ensure_authentication_token!)
  end
end
