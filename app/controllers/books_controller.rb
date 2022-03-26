class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy, :unpublish]

  def index
    @books = Book.all

    respond_to do |format|
      format.json { render json: @books }
      format.xml { render xml: @books }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @book }
      format.xml { render xml: @book }
    end
  end

  def create
  end

  def update

  end

  def destroy

  end

  def unpublish

  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author_id, :cover, :price)
  end
end
