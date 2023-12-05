class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
    @books = Book.all
    @categories = ['happy', 'sad', 'excited', 'calm', 'serious', 'angry']
    @category_backgrounds = determine_category_backgrounds

    if params[:query].present?
      sql_subquery = "name ILIKE :query OR synopsis ILIKE :query OR mood ILIKE :query OR author ILIKE :query"
      @books = @books.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @categories = ['happy', 'sad', 'excited', 'calm', 'serious', 'angry']
    @category_backgrounds = determine_category_backgrounds
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

  private

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
end
