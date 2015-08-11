class Round < ActiveRecord::Base
  QUESTIONS_COUNT = 3

  belongs_to :game
  belongs_to :category
  has_many :round_questions, inverse_of: :round

  validates :game, :category, presence: true
  validates :round_questions, length: { is: QUESTIONS_COUNT }
end
