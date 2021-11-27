class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    end

  end

  def show
    @book_create = Book.new
    @book = Book.find(params[:id])

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"

  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)

  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
