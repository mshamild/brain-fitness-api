class AnswerVariant < ActiveRecord::Base
  belongs_to :question, inverse_of: :answer_variants

  validates :question, :text, presence: true
end
