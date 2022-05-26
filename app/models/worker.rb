class Worker < ApplicationRecord
  has_many :progresses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, length: { minimum: 1, maximum: 20 }
  validates :first_name, length: { minimum: 1, maximum: 20 }

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
