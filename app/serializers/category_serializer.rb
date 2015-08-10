class CategorySerializer < ApplicationSerializer
  has_many :questions

  attributes :title, :color
end
