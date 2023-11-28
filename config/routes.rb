Rails.application.routes.draw do
  get 'books/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
  get '/fetch_api_data', to: 'books#fetch_api_data'
end
