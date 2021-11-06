class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new

  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to user_path(current_user.id)

  end

  def show

  end

  def destroy

  end

  def edit

  end

end
