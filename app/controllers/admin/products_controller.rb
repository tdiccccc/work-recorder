class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @product = Product.new
    @processes = ProductionProcess.all
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to admin_products_path, notice: "商品 #{@product.name} を登録しました。"
    else
      render :new
    end
  end

  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @processes = ProductionProcess.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(products_params)
    redirect_to admin_product_path
  end

  private

  def products_params
    params.require(:product).permit(:production_process_id, :name, :introduction)
  end
end
