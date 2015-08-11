require 'rails_helper'

describe GameCreator do
  let(:user) { create :user }

  context 'when created games not exists' do
    it 'creates new game' do
      game = described_class.call(user: user).game

      expect(game.users.to_a).to eq [user]
      expect(game.users_count).to eq 1
    end
  end

  context 'when game exists' do
    let(:another_user) { create :user }

    before do
      create :game, users: [another_user]
    end

    it 'attach user to game' do
      game = described_class.call(user: user).game

      expect(game.users).to eq [another_user, user]
      expect(game.users_count).to eq 2
    end
  end
end
