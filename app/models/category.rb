class Category < ActiveRecord::Base
  include RandomRecords

  has_many :questions
end
