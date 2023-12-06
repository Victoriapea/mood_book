class LibraryController < ApplicationController
  def add_book
    @book = Book.find(params[:id])

    if current_user.books.include?(@book)
      flash[:notice] = 'Livre dèjà dans la bibliothèque.'
      flash[:book_id] = @book.id
    else
      current_user.books << @book
      flash[:notice] = 'Livre ajouté à la bibliothèque avec succès.'
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
  flash[:notice] = 'Livre retiré de la bibliothèque avec succès.'
  respond_to do |format|
    format.js
    format.html { redirect_back(fallback_location: root_path) }
    end
  end
end
