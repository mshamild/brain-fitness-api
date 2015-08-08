class Round < ActiveRecord::Base
  belongs_to :game, inverse_of: :rounds
  has_many :round_categories, class_name: 'Round::Category'

  validates :game, presence: true
end
