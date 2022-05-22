class Admin::ProgressesController < ApplicationController
  def index
    @progresses = Progress.all.order(end_time: "DESC")
  end

  def worker_index
    @worker = Worker.find(params[:id])
    @progresses = @worker.progresses.order(end_time: "DESC")
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
    redirect_to admin_progress_path(@progress)
  end

  private

  def progress_params
    params.require(:progress).permit(:product_id, :worker_id, :product_count, :begin_time, :end_time)
  end

end
