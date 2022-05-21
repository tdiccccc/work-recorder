class Worker::ProgressesController < ApplicationController

  def create
    @progress = Progress.new(progress_params)
    @progress.worker_id = current_worker.id
    if @progress.save
      redirect_to edit_progress_path(@progress)
    else
      redirect_to product_path(product.id)
    end
  end

  def edit
    @product = Product.find(params[:id])
    @progress = Progress.find(params[:id])
    #@progress.id = Progress.where(end_time: nil)
  end

  def start
    @progress = Progress.find(params[:id])
    @progress.begin_time = DateTime.now
    @progress.save!
    redirect_to edit_progress_path(@progress)
  end

  def finish
    @progress = Progress.find(params[:id])
    @progress.end_time = DateTime.now
    @progress.save!
    redirect_to progress_path(@progress.id)
  end

  def index
    @progresses = Progress.all
  end

  def show
    @progress = Progress.find(params[:id])
  end

  def worker_index
    @worker = Worker.find(params[:id])
    @progresses = @worker.progresses
    #@progresses = Progress.where(@worker == [:worker_id])
  end

  private

  def progress_params
    params.require(:progress).permit(:product_id, :worker_id, :product_count, :begin_time, :end_time)
  end
end
