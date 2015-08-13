require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Games' do
  subject(:json_response) { json_response_body }

  before do
    create_list :category, 3, :with_questions
  end

  post '/v1/games' do
    let(:auth_token) { create(:user).authentication_token }

    parameter :auth_token, required: true

    context 'when games not exists' do
      example_request 'Create new game' do
        game = Game.find(json_response['game']['id'])

        expect(json_response['game']).to eq be_a_game_representation(game)
      end
    end
  end
end
