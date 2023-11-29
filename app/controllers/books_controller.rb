# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
<<<<<<< HEAD
    @categories = ['science', 'fiction', 'history' , 'love','foot']
=======
>>>>>>> 0b6af6602308d8f475c1481a5cd2e72df80e2109
  end

  def show
    category = params[:category]
    @category = category.capitalize
  end

  def add_to_library
    book_id = params[:book_id]
    redirect_to library_path
  end

end
