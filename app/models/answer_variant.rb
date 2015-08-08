class AnswerVariant < ActiveRecord::Base
  belongs_to :question

  validates :question, :text, presence: true
end
