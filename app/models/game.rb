class Game < ActiveRecord::Base
  ROUNDS = 6

  has_many :rounds, inverse_of: :game

  validates :rounds, length: { is: 6 }
end
