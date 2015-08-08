require 'rails_helper'

RSpec.describe Round, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:game) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:game) }
  end
end
