Rails.application.routes.draw do

  root 'static_pages#top'
  
# get 'users/new' コントローラーを生成したときに一緒に作られたルーティング
  get '/signup', to: 'users#new'
  
  # ログイン機能
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    collection { post :import }
    patch 'update_basic_info'

    member do
      # collection { post :import }
      # patch 'update_basic_info'
    end
    resources :attendances, only: :update
  end
end
