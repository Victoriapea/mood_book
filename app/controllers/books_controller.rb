# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
    @categories = ['science', 'fiction', 'history' , 'love']
  end

  def show
    category = params[:category]
    @category = category.capitalize

    api_key = 'AIzaSyBwshVXgMANcDkVDw-R-mnQ6lmIKljX6gE'

    api_url = "https://www.googleapis.com/books/v1/volumes?q=#{CGI.escape(category)}&key=#{api_key}"

    begin
      response = RestClient.get(api_url)
      @books = JSON.parse(response.body)['items']
    rescue RestClient::ExceptionWithResponse => e
      @error_message = "Erreur lors de la récupération des livres: #{e.response}"
    end
  end
end
