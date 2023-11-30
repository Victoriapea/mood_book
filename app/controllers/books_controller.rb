# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
    @books = Book.all
    @categories = ['science', 'fiction', 'history', 'love']
  end

  def show
    category = params[:category]
    @category = category.capitalize
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to dashboard_path, notice: "Le livre a été supprimé avec succès", status: :see_other
  end
end
