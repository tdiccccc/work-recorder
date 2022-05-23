class Admin::ProductionProcessesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @process = ProductionProcess.new
    @processes = ProductionProcess.page(params[:page])
  end

  def create
    @process = ProductionProcess.new(process_params)
    @processes = ProductionProcess.page(params[:page])
    if @process.save
      flash.now[:notice] = "工程を登録しました"
    else
      flash.now[:alert] = "工程名が未入力です"
      @processes = ProductionProcess.page(params[:page])
    end
  end

  def edit
    @process = ProductionProcess.find(params[:id])
  end

  def update
    @process = ProductionProcess.find(params[:id])
    @process.update(process_params)
    redirect_to admin_production_processes_path, notice: '工程名を更新'
  end

  private

  def process_params
    params.require(:production_process).permit(:name)
  end
end
