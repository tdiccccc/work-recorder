class Admin::WorkersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @workers = Worker.page(params[:page])
  end

  def show
    @worker = Worker.find(params[:id])
    @progresses = @worker.progresses
    #一時間当たり生産量の平均
    @average = Progress.average_count(@worker.id)

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
    if @worker.update(workers_params)
      redirect_to admin_worker_path(@worker), notice: '従業員情報を更新しました'
    else
      redirect_to edit_admin_worker_path(@worker), alert: '従業員情報の更新に失敗しました'
    end
  end

  private

  def workers_params
    params.require(:worker).permit(:first_name, :last_name, :email, :is_deleted)
  end
end
