# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
  end

  def show
    category = params[:category]
    @category = category.capitalize
  end
end
