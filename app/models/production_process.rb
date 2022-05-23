class ProductionProcess < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, length: { minimum: 1, maximum: 30 }
end
