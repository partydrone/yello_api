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
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.json { render json: @book, status: :created }
        format.xml { render xml: @book, status: :created }
      else
        format.json { render json: @book.errors, status: :unprocessable_entity }
        format.xml { render xml: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.json { render json: @book, status: :ok }
        format.xml { render xml: @book, status: :ok }
      else
        format.json { render json: @book.errors, status: :unprocessable_entity }
        format.xml { render xml: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.xml { head :no_content }
    end
  end

  def unpublish

  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :user_id, :cover, :price)
  end
end
