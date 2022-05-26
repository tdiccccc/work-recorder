Rails.application.routes.draw do

  root to: 'homes#top'
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :production_processes, only: [:index, :create, :edit, :update]
    resources :products, only: [:index, :new, :show, :create, :show, :edit, :update]
    resources :workers, only: [:index, :show, :edit, :update]
    resources :progresses, only: [:index, :show, :edit, :update]
    get 'worker_index/:id' => 'progresses#worker_index', as: 'worker_index' #従業員タスク履歴
  end

  #従業員用
  devise_for :worker,skip: [:passwords], controllers: {
    registrations: "worker/registrations",
    sessions: 'worker/sessions'
  }
  scope module: :worker do
    resources :workers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :show]
    resources :progresses, only: [:show, :create, :edit, :update]

    patch 'progresses/:id/start' => 'progresses#start', as: 'progresses_start' #商品開始
    patch 'progresses/:id/finish' => 'progresses#finish', as: 'progresses_finish' #商品終了
    get 'worker_index/:id' => 'progresses#worker_index', as: 'worker_index' #従業員タスク履歴
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
