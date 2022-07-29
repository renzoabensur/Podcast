Rails.application.routes.draw do
  root to: 'pages#index'
  
  resources :podcastscrappings do
    match '/scrape', to: 'podcastscrappings#scrape', via: :post, on: :collection
  end

  get '/index_user', to: 'user#index', as: 'user_index'
  get '/login_user', to: 'user#login', as: 'user_login'
  get '/logout_user', to: 'user#logout', as: 'user_logout'
  get '/create_user', to: 'user#create', as: 'create_user'
  get '/fail_user', to: 'user#fail', as: 'fail_user'
  get '/profile_user', to: 'user#profile', as: 'user_profile'
end
