Rails.application.routes.draw do
  # get 'pages/index'
  # root "pages#index"

  # resources :articles
  resources :podcastscrappings do
    match '/scrape', to: 'podcastscrappings#scrape', via: :post, on: :collection
  end

  root to: 'podcastscrappings#index'
end
