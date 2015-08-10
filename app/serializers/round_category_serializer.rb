class RoundCategorySerializer < ApplicationSerializer
  has_many :round_questions
  has_one :category, except: [:questions]
end
