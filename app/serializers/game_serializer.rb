class GameSerializer < ApplicationSerializer
  has_many :rounds
  has_many :users
end
