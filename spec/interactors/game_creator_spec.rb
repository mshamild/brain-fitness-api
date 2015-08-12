require 'rails_helper'

describe GameCreator do
  let(:user) { create :user }
  let(:game) { described_class.call(user: user).game }

  before do
    create_list :category, 3, :with_questions
  end

  it 'creates new game with user' do
    expect(game).to be_persisted
    expect(game).to be_valid
    expect(game.users).to eq [user]
  end
end
