class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.search_by_name_synopsis_author_and_mood(params[:query])
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def fetch_books

    url = URI("https://hapi-books.p.rapidapi.com/nominees/romance/2020")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = '4ac030e043msh588c37b3b82dc90p1eaf14jsnb60507a44b7c'
    request["X-RapidAPI-Host"] = 'hapi-books.p.rapidapi.com'

    response = http.request(request)

    if response.code.to_i == 200
      JSON.parse(response.body)
    else
      # Gérer les erreurs ici
      []
    end
  end
end
