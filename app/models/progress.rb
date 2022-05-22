class Progress < ApplicationRecord
  belongs_to :worker
  belongs_to :product

  validates :product_count, presence: true

  def time_diff
    (end_time - begin_time) / 60 / 60
  end

  #一時間当たりの生産量の計算
  def count_per_hour
    product_count / time_diff
  end

  #一時間当たり生産量の平均
  def average_count(worker_id)
   #Progress.average(:count_per_hour).to_i
     product_counts = 0
     amount = 0
     Worker.find(worker_id).progresses.find_each do |progress|
       product_counts += progress.product_count
       amount += progress.time_diff
     end
     product_counts / amount
  end

  scope :created_today, -> { where(end_time: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(end_time: 1.day.ago.all_day) } # 前日
  scope :created_2day_ago, -> { where(end_time: 2.day.ago.all_day) } # 2日前
  scope :created_3day_ago, -> { where(end_time: 3.day.ago.all_day) } # 3日前
  scope :created_4day_ago, -> { where(end_time: 4.day.ago.all_day) } # 4日前
  scope :created_5day_ago, -> { where(end_time: 5.day.ago.all_day) } # 5日前
  scope :created_6day_ago, -> { where(end_time: 6.day.ago.all_day) } # 6日前

  scope :created_this_week, -> { where(end_time: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
  scope :created_last_week, -> { where(end_time: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } # 前週

  scope :created_this_month, -> { where(end_time: Time.zone.now.all_month) }#今月
end
