class Worker::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @progress = Progress.new
  end

  private

  # def progress_params
  #   params.require(:progress).permit(:product_id, :worker_id, :product_count, :begin_time, :end_time)
  # end
end
