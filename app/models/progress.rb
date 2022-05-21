class Progress < ApplicationRecord
  belongs_to :worker
  belongs_to :product

  def time_diff
    (end_time - begin_time) / 60 / 60
  end

  def product_count_average
    product_count / time_diff
  end

  scope :created_today, -> { where(end_time: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(end_time: 1.day.ago.all_day) } # 前日

  scope :created_this_week, -> { where(end_time: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
  scope :created_last_week, -> { where(end_time: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } # 前週
end
