class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
  end

  def destroy
  end

  def update
  end

end
