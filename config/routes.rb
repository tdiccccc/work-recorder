Rails.application.routes.draw do
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :production_processes, only: [:index, :create, :edit, :update]
    resources :products, only: [:index, :new, :show, :create, :show, :edit, :update]
    resources :workers, only: [:index, :show, :edit, :update]
    resources :progresses, only: [:index, :show]
  end

  #従業員用
  devise_for :worker,skip: [:passwords], controllers: {
    registrations: "worker/registrations",
    sessions: 'worker/sessions'
  }
  scope module: :worker do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :workers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :show]
    resources :progresses, only: [:index, :show, :create]

    post 'progresses/start' => 'progresses#start' #商品開始
    post 'progresses/finish' => 'progresses#finish' #商品終了
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
