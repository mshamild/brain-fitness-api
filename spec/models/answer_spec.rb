require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:round_question) }
    it { is_expected.to belong_to(:answer_variant) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:round_question) }
    it { is_expected.to validate_presence_of(:answer_variant) }
  end
end
