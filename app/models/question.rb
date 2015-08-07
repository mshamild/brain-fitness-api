class Question < ActiveRecord::Base
  belongs_to :category
  has_many :answer_variants

  validates :category, presence: true
end
