class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @books = Book.all
    if params[:query].present?
      @books = @books.where(title: params[:query])
    end
  end
end
