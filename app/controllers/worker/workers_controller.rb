class Worker::WorkersController < ApplicationController
  before_action :authenticate_worker!
  before_action :ensure_correct_worker, only: [:edit, :update]

  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
    @progresses = @worker.progresses

    @today_progress = @progresses.created_today
    @yesterday_progress = @progresses.created_yesterday
    @this_week_progress = @progresses.created_this_week
    @last_week_progress = @progresses.created_last_week
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.update(workers_params)
    redirect_to worker_path(params[:id])
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
