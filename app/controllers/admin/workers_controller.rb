class Admin::WorkersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @workers = Worker.all
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
    flash[:notice] = "従業員情報を更新しました。"
    redirect_to admin_worker_path(@worker)
  end

  private

  def workers_params
    params.require(:worker).permit(:first_name, :last_name, :email, :is_deleted)
  end
end
