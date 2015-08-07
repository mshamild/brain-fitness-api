require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Registrations' do
  subject(:json_response) { json_response_body }

  post '/v1/registrations' do
    parameter :email, 'Email', required: true, scope: :user
    parameter :password, 'Password', required: true, scope: :user
    parameter :name, 'Name', scope: :user

    let(:name) { 'Name' }

    context "with valid attributes" do
      let(:email) { 'newuser@example.com' }
      let(:password) { 'password' }

      example_request 'Sign in with valid password' do
        expect(json_response['user']).to be_a_user_representation User.find_by(email: email)
      end
    end

    context "with invalid attributes" do
      let(:email) { ['newuser@example.com', nil].sample }
      let(:password) { 'password' unless email }

      example_request 'Sign in with invalid password', password: '' do
        expect(response_status).to eq 422
      end
    end
  end

  patch '/v1/registrations' do
    let(:current_user) { create :user, email: 'user@example.com', name: 'Name', password: 'password' }

    parameter :email, 'Email', scope: :user
    parameter :password, 'Password', scope: :user
    parameter :name, 'Name', scope: :user
    parameter :auth_token, required: true

    let(:name) { 'newName' }
    let(:email) { 'newuser@example.com' }
    let(:password) { 'newpassword' }

    context "when auth token valid" do
      let(:auth_token) { current_user.authentication_token }

      example_request 'Update user with valid attributes' do
        current_user.reload

        expect(current_user.email).to eq email
        expect(current_user.name).to eq name
        expect(current_user).to be_valid_password password

        expect(response_status).to eq 204
      end
    end

    context "when auth token valid" do
      let(:auth_token) { :invalid_token }

      example_request 'Update user' do
        expect(response_status).to eq 401
      end
    end
  end
end
