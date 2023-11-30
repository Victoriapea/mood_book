# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
    @categories = ['science', 'fiction', 'history', 'love']
  end

  def show
    @books = Book.all
    category = params[:category]
    @category = category.capitalize
  end
end
