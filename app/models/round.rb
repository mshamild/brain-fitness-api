class Round < ActiveRecord::Base
  belongs_to :game, inverse_of: :rounds

  validates :game, presence: true
end
