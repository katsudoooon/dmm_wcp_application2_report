class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:book_create] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
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
    if @book.user == current_user
      render :edit
    else
      redirect_to "/books"
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:book_update] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
