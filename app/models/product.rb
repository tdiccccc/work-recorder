class Product < ApplicationRecord
  has_many :progresses, dependent: :destroy
  belongs_to :production_process

  validates :production_process_id, presence: true
  validates :name, presence: true
  validates :introduction, length: { minimum: 1, maximum: 200 }
end
