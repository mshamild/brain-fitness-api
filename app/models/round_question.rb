class RoundQuestion < ActiveRecord::Base
  belongs_to :round_category, inverse_of: :round_questions
  belongs_to :question
  has_many :answer_variants, primary_key: :question_id, foreign_key: :question_id

  validates :round_category, :question, presence: true
end
