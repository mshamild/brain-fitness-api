require 'rails_helper'

RSpec.describe AnswerVariant, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:question) }
  end
end
