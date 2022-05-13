class Recommendation < ApplicationRecord
  has_one :source, class_name: 'Book'
  has_one :result, class_name: 'Book'
  belongs_to :user
end
