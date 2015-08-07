class AnswerVariant < ActiveRecord::Base
  belongs_to :question

  validates :question, presence: true
end
