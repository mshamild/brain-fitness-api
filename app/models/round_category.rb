class RoundCategory < ActiveRecord::Base
  QUESTIONS_COUNT = 3

  belongs_to :round, inverse_of: :round_categories
  belongs_to :category
  has_many :round_questions, inverse_of: :round_category

  validates :round, :category, presence: true
  validates :round_questions, length: { is: QUESTIONS_COUNT }
end
