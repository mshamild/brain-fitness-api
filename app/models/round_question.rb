class RoundQuestion < ActiveRecord::Base
  belongs_to :round_category, inverse_of: :round_questions
  belongs_to :question

  validates :round_category, :question, presence: true
end
