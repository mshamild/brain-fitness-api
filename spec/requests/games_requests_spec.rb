require 'rails_helper'

describe 'Game', type: :request do
  let(:json_response) { JSON.parse body }
  let(:bill) { create :user }
  let(:bill_token) { bill.authentication_token }
  let(:linus) { create :user }
  let(:linus_token) { linus.authentication_token }

  before do
    create_list :category, 3, :with_questions
  end

  it 'do game' do
    post '/v1/games', auth_token: bill_token
    game = Game.last

    expect(json_response['game']).to be_a_game_representation(game)
    # expect(json_response['available_categories']).to be

    post '/v1/games', auth_token: linus_token

    expect(Game.count).to eq 1
    expect(game.users).to include bill
    expect(game.users).to include linus
  end
end
