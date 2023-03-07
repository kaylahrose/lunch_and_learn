Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      # TODO: nested namespace?
      resources :recipes, only: [:index]
      resources :learning_resources, only: [:index]
      resources :users, only: [:index, :create]
    end 
  end
end
