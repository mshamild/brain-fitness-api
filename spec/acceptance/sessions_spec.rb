require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Sessions' do
  subject(:json_response) { json_response_body }

  post '/v1/sessions' do
    let(:existing_user) { create :user, password: '123456' }
    let(:user) { {} }

    with_options(required: true, scope: :user) do |u|
      u.parameter :email, 'Email'
      u.parameter :password, 'Password'
    end

    let(:email) { existing_user.email }

    context 'when valid password' do
      let(:password) { '123456' }

      example_request 'Sign in' do
        expect(json_response['user']).to be_a_user_representation(existing_user)
      end
    end

    context 'when invalid password' do
      let(:password) { 'invalid_password' }

      example_request 'Sign in' do
        expect(response_status).to eq 401
      end
    end
  end
end
