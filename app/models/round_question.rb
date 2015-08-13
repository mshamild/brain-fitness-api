class RoundQuestion < ActiveRecord::Base
  belongs_to :round_category, inverse_of: :round_questions
  belongs_to :question
  has_many :answers

  validates :round_category, :question, presence: true

  accepts_nested_attributes_for :answers
end
