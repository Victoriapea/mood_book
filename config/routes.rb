Rails.application.routes.draw do
  get 'books/index'
  devise_for :users
  root to: "pages#home"
  get :dashboard, to: "pages#dashboard"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index]
  get 'books/:category', to: 'books#show', as: :book_category


  # Defines the root path route ("/")
  # root "articles#index"
  post '/library/add', to: 'library#add_book'
  post 'add_to_library', to: 'books#add_to_library', as: 'add_to_library'
  get 'library', to: 'library#index', as: 'library'  # Ajoutez cette route pour afficher la bibliothèque

end
