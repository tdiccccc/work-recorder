class Admin::ProductionProcessesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @process = ProductionProcess.new
    @processes = ProductionProcess.all
  end

  def create
    @process = ProductionProcess.new(process_params)
    @processes = ProductionProcess.all
    if @process.save
      flash.now[:notice] = "工程を登録しました"
    else
      flash.now[:alert] = "工程名が未入力か、文字数が多すぎます"
      @processes = ProductionProcess.all
    end
  end

  def edit
    @process = ProductionProcess.find(params[:id])
  end

  def update
    @process = ProductionProcess.find(params[:id])
    if @process.update(process_params)
      redirect_to admin_production_processes_path, notice: '工程名を更新しました'
    else
      redirect_to edit_admin_production_process_path(@process), alert: '工程名の更新に失敗しました'
    end
  end

  private

  def process_params
    params.require(:production_process).permit(:name)
  end
end
