class Round::Category < ActiveRecord::Base
  QUESTIONS_COUNT = 3

  belongs_to :round, inverse_of: :round_category
  belongs_to :category, class_name: '::Category'
  has_many :round_questions, class_name: 'Round::Question', inverse_of: :round_category

  validates :round, presence: true
  validates :round_questions, length: { is: QUESTIONS_COUNT }
end
