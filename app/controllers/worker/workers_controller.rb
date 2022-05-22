class Worker::WorkersController < ApplicationController
  before_action :authenticate_worker!
  before_action :ensure_correct_worker, only: [:edit, :update]

  def index
    @workers = Worker.page(params[:page])
  end

  def show
    @worker = Worker.find(params[:id])
    @progress = Progress.find(params[:id])
    #一時間当たり生産量の平均
    @average = @progress.average_count(@worker.id)

    @progresses = @worker.progresses

    @today_progress = @progresses.created_today
    @yesterday_progress = @progresses.created_yesterday
    @this_week_progress = @progresses.created_this_week
    @last_week_progress = @progresses.created_last_week
    @this_month_progress = @progresses.created_this_month
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.update(workers_params)
    redirect_to worker_path(params[:id]), notice: "従業員情報を更新しました。"
  end

  private

  def workers_params
    params.require(:worker).permit(:first_name, :last_name, :email)
  end

  #自分の従業員情報のみ編集可能
  def ensure_correct_worker
    @worker = Worker.find(params[:id])
    unless @worker == current_worker
      redirect_to worker_path(current_worker)
    end
  end
end
