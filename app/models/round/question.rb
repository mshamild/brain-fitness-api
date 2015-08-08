class Round::Question < ActiveRecord::Base
  belongs_to :round_category, class_name: 'Round::Category'
  belongs_to :question, class_name: '::Question'
  has_many :answer_variants, primary_key: :question_id, foreign_key: :question_id
end
