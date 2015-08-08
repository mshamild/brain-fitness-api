class Game < ActiveRecord::Base
  ROUNDS = 6

  has_many :rounds, inverse_of: :game

  validates :rounds, presence: true
  validates :rounds, length: { is: 6 }
end
