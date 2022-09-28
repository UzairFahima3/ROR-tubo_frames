Rails.application.routes.draw do
  # get 'properties/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resource :properties do
    collection do
      post :search
    end
  end

  root "properties#index"

  # resources :properties
end
