class Round < ActiveRecord::Base
  CATEGORIES_COUNT = 3

  belongs_to :game, inverse_of: :rounds
  has_many :round_categories, class_name: 'RoundCategory', inverse_of: :round

  validates :game, presence: true
  validates :round_categories, length: { is: CATEGORIES_COUNT }

  accepts_nested_attributes_for :round_categories
end
