# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'

  def index
    category = params[:category]

    # Assurez-vous que le paramètre de requête "category" est présent
    if category.present?
      api_key = 'AIzaSyBwshVXgMANcDkVDw-R-mnQ6lmIKljX6gE'  # Remplacez cela par votre clé API

      # Construire l'URL de l'API Google Books avec la clé API
      api_url = "https://www.googleapis.com/books/v1/volumes?q=#{CGI.escape(category)}&key=#{api_key}"

      begin
        response = RestClient.get(api_url)
        @books = JSON.parse(response.body)['items']
      rescue RestClient::ExceptionWithResponse => e
        @error_message = "Erreur lors de la récupération des livres: #{e.response}"
      end
    else
      @error_message = "Le paramètre de requête 'category' est manquant."
    end
  end
end
