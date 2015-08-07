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
end
