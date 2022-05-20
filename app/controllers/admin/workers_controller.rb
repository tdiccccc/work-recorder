class Admin::WorkersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
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
