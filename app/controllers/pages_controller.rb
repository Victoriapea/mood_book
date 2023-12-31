class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @books = Book.all
  end

  def dashboard
    @review = Review.new
  end
end
