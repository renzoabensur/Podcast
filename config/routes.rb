Rails.application.routes.draw do
  resources :podcastscrappings do
    match '/scrape', to: 'podcastscrappings#scrape', via: :post, on: :collection
  end

  root to: 'podcastscrappings#index'
  get 'users', controller: 'users', action: 'create'
end
