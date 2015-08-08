class Round::Category < ActiveRecord::Base
  belongs_to :round
  belongs_to :category
  has_many :round_questions, class_name: 'Round::Question'
end
