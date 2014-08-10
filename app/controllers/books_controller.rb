class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
  end

  def show
  end

  def destroy
  end

  def update
  end

end
