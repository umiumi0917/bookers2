class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page])
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
