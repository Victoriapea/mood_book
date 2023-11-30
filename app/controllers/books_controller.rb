# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
    @categories = ['science', 'fiction', 'history' , 'love','foot']
    @books = Book.all
    @categories = ['science', 'fiction', 'history', 'love']
  end
  def show
    @category = params[:category]
    @books = Book.find_books_by_category(@category)

    puts "Category: #{@category}"
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to dashboard_path, notice: "Le livre a été supprimé avec succès", status: :see_other
  end
end
