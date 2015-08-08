require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:answer_variants) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:answer_variants) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_length_of(:answer_variants) }
  end
end
