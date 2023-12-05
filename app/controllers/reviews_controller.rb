class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
    @review = Review.new
  end


  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.book = @book
    if @review.save
      redirect_to dashboard_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:rating)
  end
end
