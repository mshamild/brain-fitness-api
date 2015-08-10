class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_and_belongs_to_many :games

  before_save :ensure_authentication_token!

  def ensure_authentication_token!
    self.authentication_token = generate_authentication_token if authentication_token.blank?
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.find_by_authentication_token(token)
    end
  end
end
