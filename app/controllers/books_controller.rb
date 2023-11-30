# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
    @categories = ['happy', 'sad', 'excited', 'calm', 'serious']
  end
  def show
    @category = params[:category]
    @books = Book.find_books_by_category(@category)

    puts "Category: #{@category}"
  end

end
