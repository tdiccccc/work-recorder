class Progress < ApplicationRecord
  belongs_to :worker
  belongs_to :product

  def time_diff
    (end_time - begin_time) / 60 / 60
  end

  def product_count_average
    product_count / time_diff
  end

end
