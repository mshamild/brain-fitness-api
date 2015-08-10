require 'rails_helper'

describe GameCreator do
  let(:user) { create :user }
  let(:game) { described_class.call(user: user).game }

  before do
    create_list :category, 3, :with_questions
  end

  it 'creates new game' do
    expect(game).to be_persisted
    expect(game).to be_valid

    expect(game.rounds.count).to eq 6

    game.rounds.each do |round|
      expect(round).to be_persisted

      expect(round.round_categories.count).to eq 3

      round.round_categories.each do |round_category|
        expect(round_category).to be_persisted

        expect(round_category.round_questions.count).to eq 3

        round_category.round_questions.each do |round_question|
          expect(round_question).to be_valid
        end
      end
    end
  end
end
