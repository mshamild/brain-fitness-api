class RoundQuestionSerializer < ApplicationSerializer
  has_one :question
  has_many :answers
end
