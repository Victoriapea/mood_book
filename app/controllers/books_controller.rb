<<<<<<< HEAD
# app/controllers/books_controller.rb
require 'rest-client'
class BooksController < ApplicationController
  def fetch_data_from_api
    url = "https://hapi-books.p.rapidapi.com/nominees/romance/2020"
    headers = {
      "X-RapidAPI-Key" => '8637eac372msh15595975c674ed1p18b253jsn459d8714cd9b',
      "X-RapidAPI-Host" => 'hapi-books.p.rapidapi.com'
    }
    begin
      response = RestClient.get(url, headers: headers)
      puts response.body
      @books_data = JSON.parse(response.body)["nominees"]
    rescue RestClient::ExceptionWithResponse => e
      puts "Erreur API: #{e.response}"
      @error_message = "Erreur lors de la récupération des données de l'API. Veuillez vérifier votre clé d'API et les autorisations."
      @books_data = []
    end


  end
=======
class BooksController < ApplicationController
>>>>>>> a4f9cd7c288b542d175dc5819ad14fd5c8e7837d
end
