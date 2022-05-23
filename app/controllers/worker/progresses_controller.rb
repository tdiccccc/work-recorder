class Worker::ProgressesController < ApplicationController
  before_action :authenticate_worker!
  before_action :ensure_correct_worker, only: [:edit, :update]

  def create
    @progress = Progress.new(progress_params)
    @progress.worker_id = current_worker.id
    if @progress.save
      redirect_to edit_progress_path(@progress), notice: 'タイマーを開始してください'
    else
      redirect_to products_path, alert: '部数を入力してください'
    end
  end

  def edit
    @progress = Progress.find(params[:id])
  end

  def update
    @progress = Progress.find(params[:id])
    @progress.update(progress_params)
    redirect_to progress_path(@progress), notice: '実績を更新しました'
  end
  def start
    @progress = Progress.find(params[:id])
    @progress.begin_time = DateTime.now
    @progress.save
    redirect_to edit_progress_path(@progress), notice: 'タイマーが開始されました'
  end

  def finish
    @progress = Progress.find(params[:id])
    @progress.end_time = DateTime.now
    @progress.save
    redirect_to progress_path(@progress.id), notice: '実績が登録されました'
  end

  def index
    @progresses = Progress.page(params[:page])
  end

  def show
    @progress = Progress.find(params[:id])
  end

  def worker_index
    @worker = Worker.find(params[:id])
    @progresses = @worker.progresses.page(params[:page]).order(end_time: "DESC")
  end

  private

  def progress_params
    params.require(:progress).permit(:product_id, :worker_id, :product_count, :begin_time, :end_time)
  end

  def product_params

  end
  #自分の実績のみ編集可能
  def ensure_correct_worker
    @progress = Progress.find(params[:id])
    unless @progress.worker == current_worker
      redirect_to worker_path(current_worker)
    end
  end

end
