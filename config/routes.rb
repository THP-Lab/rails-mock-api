Rails.application.routes.draw do
  # HTML view route
  root 'triple#index'
  resources :triple, only: [ :index, :create ]
  
  # API routes
  namespace :api do
    namespace :v1 do
      resources :graph, only: [ :index, :create ]
    end
  end
end
