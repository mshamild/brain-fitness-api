class QuestionSerializer < ApplicationSerializer
  has_many :answer_variants

  attributes :text
end
