# app/controllers/books_controller.rb

class BooksController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'cgi'

  def index
    @categories = ['happy', 'sad', 'excited', 'calm', 'serious']
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
      'url(/assets/happy.jpg)'
    when 'sad'
      'url(/assets/sad.jpg)'
    when 'excited'
      'url(/assets/excited.jpg)'
    when 'calm'
      'url(/assets/calme.jpg)'
    when 'serious'
      'url(/assets/serious.jpg)'
    else
      'url(/assets/happy.jpg)'
    end
  end
end
