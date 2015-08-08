require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:rounds) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:rounds) }
    it { is_expected.to validate_length_of(:rounds) }
  end
end
