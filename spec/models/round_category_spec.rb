require 'rails_helper'

RSpec.describe RoundCategory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:round) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:round_questions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:round) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_length_of(:round_questions) }
  end
end
