class Library < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def add_book
    # Your logic to add the book to the library goes here
    # You may want to store the books in a database or session

    book_id = params[:id]
    # ... additional logic ...

    # Respond with JSON data indicating success
    render json: { success: true, book_id: book_id }
  end
end
