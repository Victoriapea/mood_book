class LibraryController < ApplicationController
  def add_book
    @book = Book.find(params[:id])

    if current_user.books.include?(@book)
      flash[:notice] = 'Book already in library.'
      flash[:book_id] = @book.id
    else
      current_user.books << @book
      flash[:notice] = 'Book added to library successfully.'
      flash[:book_id] = @book.id
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy_book
    @book = Book.find(params[:id])
    current_user.books.delete(@book)
    flash[:notice] = 'Book removed from library successfully.'
    respond_to do |format|
      format.js
      format.html { redirect_back(fallback_location: root_path) }
    end
  end
end
