Rails.application.routes.draw do

  root 'static_pages#top'
  
# get 'users/new' 　　　　　　　　コントローラーを生成したときに一緒に作られたルーティング
  get '/signup', to: 'users#new'

end
