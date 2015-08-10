require 'rails_helper'

RSpec.describe RoundQuestion, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:round_category) }
    it { is_expected.to belong_to(:question) }
    it { is_expected.to have_many(:answer_variants) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:round_category) }
    it { is_expected.to validate_presence_of(:question) }
  end
end
