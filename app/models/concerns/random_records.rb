module RandomRecords
  extend ActiveSupport::Concern

  included do
    scope :random, -> (count = 3) { order('random()').limit(count) }
  end
end
