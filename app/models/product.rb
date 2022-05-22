class Product < ApplicationRecord
  has_many :progresses
  has_many :workers, through: :progresses
  belongs_to :production_process

  validates :production_process_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
end
