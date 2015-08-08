require 'rails_helper'

RSpec.describe AnswerVariant, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:question) }

    describe 'validations' do
      it { is_expected.to validate_presence_of(:question) }
      it { is_expected.to validate_presence_of(:text) }
    end
  end
end
