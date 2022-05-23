class Worker::ProductsController < ApplicationController
  before_action :authenticate_worker!
  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @progress = Progress.new
  end
end
