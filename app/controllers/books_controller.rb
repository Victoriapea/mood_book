class BooksController < ApplicationController
  def index
    @books = Book.all
    if params[:query].present?
      sql_subquery =<<~SQL
      books.name ILIKE :query
      OR books.author ILIKE :query
      OR books.synopsis ILIKE :query
      OR books.mood ILIKE :query
      SQL
      @books = @books.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end
end
