class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: false

  belongs_to :category
end
