Rails.application.routes.draw do
  root to: 'pages#index'
  
  resources :podcastscrappings do
    match '/scrape', to: 'podcastscrappings#scrape', via: :post, on: :collection
  end

  get '/index_user', to: 'users#index', as: 'user_index'
  get '/login_user', to: 'users#login', as: 'user_login'
  get '/create_user', to: 'users#create', as: 'create_user'
  get '/show_user', to: 'users#show', as: 'show_user'

end
