class Progress < ApplicationRecord
  belongs_to :worker
  belongs_to :product
end
