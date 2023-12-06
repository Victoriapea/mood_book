class BooksController < ApplicationController

  require 'rest-client'
  require 'json'
  require 'cgi'

  # before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all

    @books = questions_results(@books, params)

    if params[:query].present?
      sql_subquery = "name ILIKE :query OR synopsis ILIKE :query OR category ILIKE :query OR author ILIKE :query"
      @books = @books.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @categories = ['happy', 'sad', 'excited', 'calm', 'serious', 'angry']
    @category_backgrounds = determine_category_backgrounds
    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end

  def questions_results(books, params)

    if params[:question1].present? && params[:question1] == 'Livres longs'
      books = books.where('page_count >= ?', 200)
    end

    if params[:question1].present? && params[:question1] == 'Livres courts'
      books = books.where('page_count < ?', 200)
    end

    if params[:question2].present? && params[:question2] == 'Récemment publiés'
      books = books.where('published_date >= ?', Date.new(2015, 1, 1))
    end

    if params[:question2].present? && params[:question2] == 'Des classiques plus anciens'
      books = books.where('published_date < ?', Date.new(2015, 1, 1))
    end

    if params[:question3].present? && params[:question3] == 'Plutôt oui'
      books = books.where('rating >= ?', 3)
    end

    if params[:question3].present? && params[:question3] == 'Pas du tout'
      books = books.where('rating < ?', 3)
    end
    return books
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

  def determine_category_backgrounds
    backgrounds = {}
    @categories.each do |category|
      backgrounds[category] = determine_background_image(category)
    end
    backgrounds
  end

  def determine_background_image(category)
    case category
    when 'happy'
      'url()'
    when 'sad'
      'url()'
    when 'excited'
      'url()'
    when 'calm'
      'url()'
    when 'serious'
      'url()'
    when 'angry'
      'url()'
    else
      'url()'
    end
  end

  private

  # def set_book
  #   @book = Book.find(params[:id])
  # end

  def book_params
    params.require(:book).permit(:title, :author, :synopsis, :page_count, :published_date, :mood, :photo)
  end
end
