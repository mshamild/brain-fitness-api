class Question < ActiveRecord::Base
  include RandomRecords

  VARIANTS_COUNT = 4

  belongs_to :category
  has_many :answer_variants

  validates :category, :text, presence: true
  validates :answer_variants, length: { is: VARIANTS_COUNT }
end
