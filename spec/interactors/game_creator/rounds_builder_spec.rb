require 'rails_helper'

describe GameCreator::RoundsBuilder do
  let(:rounds) { described_class.call.rounds }
  let(:game) { Game.new }

  before do
    create_list :category, 3, :with_questions
  end

  it "returns valid rounds" do
    rounds.each do |round|
      round.game = game
      expect(round).to be_valid
      expect(round.round_categories.to_a.count).to eq 3
    end
  end
end
