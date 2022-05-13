class Book < ApplicationRecord
  attribute :title, :string
  attribute :author, :string
  attribute :release_date, :date
  attribute :isbn, :bigint
  attribute :updated_at, :datetime
  attribute :created_at, :datetime

  has_and_belongs_to_many :subjects
  # has_many :subjects
end
