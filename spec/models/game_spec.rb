require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:rounds) }
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:rounds) }
  end

  describe 'counter caches' do
    let(:game) { create :game }
    let(:user) { create :user }

    it 'increase users counter cache' do
      expect { game.users << user }.to change { game.reload.users_count }.from(0).to(1)
    end
  end
end
