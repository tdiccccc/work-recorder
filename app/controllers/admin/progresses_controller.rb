class Admin::ProgressesController < ApplicationController
  def index
    @progresses = Progress.all
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
