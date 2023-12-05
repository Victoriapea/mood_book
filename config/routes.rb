# config/routes.rb
Rails.application.routes.draw do
  get 'books/index'
  devise_for :users
  root to: "pages#home"
  get :dashboard, to: "pages#dashboard"

  resources :questionnaires, only: %i[new show create]
  resources :books, only: [:index, :destroy]
  resources :libraries, only: [:update]
  get 'books/:category', to: 'books#show', as: :book_category

  # Ajouter la route delete pour la bibliothèque
  delete '/library/destroy_book/:id', to: 'library#destroy_book', as: 'library_destroy_book'
  post '/library/add_book/:id', to: 'library#add_book', as: 'add_book_to_library'

end
