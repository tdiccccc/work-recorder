class Worker::WorkersController < ApplicationController
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
    redirect_to worker_path(params[:id])
  end

  private

  def workers_params
    params.require(:worker).permit(:first_name, :last_name, :email)
  end

end
