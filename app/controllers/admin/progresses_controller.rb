class Admin::ProgressesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @progresses = Progress.page(params[:page]).order(end_time: "DESC")
  end

  def worker_index
    @worker = Worker.find(params[:id])
    @progresses = @worker.progresses.page(params[:page]).order(end_time: "DESC")
  end

  def show
    @progress = Progress.find(params[:id])
  end

  def edit
    @progress = Progress.find(params[:id])
  end

  def update
    @progress = Progress.find(params[:id])
    @progress.update(progress_params)
    redirect_to admin_progress_path(@progress), notice: '実績を更新しました'
  end

  private

  def progress_params
    params.require(:progress).permit(:product_id, :worker_id, :product_count, :begin_time, :end_time)
  end

end
