class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :round_question
  belongs_to :answer_variant

  validates :user, :round_question, :answer_variant, presence: true
end
