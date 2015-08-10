require 'rails_helper'

describe GameCreator::GameBuilder do
  let(:game) { described_class.call.game }

  before do
    create_list :category, 3, :with_questions
  end

  it 'returns valid game with 6 rounds' do
    expect(game).to be_valid
  end
end
