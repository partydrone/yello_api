class BooksController < ApplicationController
  skip_before_action :authenticate_token!, only: [:index, :show]
  before_action :set_book, only: [:show, :update, :destroy, :unpublish]

  def index
    @books = Book.includes(:author).all

    respond_to do |format|
      format.json { render json: @books }
      format.xml { render xml: @books.as_json }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @book }
      format.xml { render xml: @book.as_json }
    end
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if action_allowed? && @book.save
        format.json { render json: @book, status: :created }
        format.xml { render xml: @book.as_json, status: :created }
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
        format.xml { render xml: @book.as_json, status: :ok }
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
    respond_to do |format|
      if action_allowed? && @book.unpublish!
        format.json { render json: @book, status: :ok }
        format.xml { render xml: @book, status: :ok }
      else
        format.json { render json: @book.errors, status: :unprocessable_entity }
        format.xml { render xml: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author_id, :cover, :price)
  end

  def action_allowed?
    (@book.author_id == @current_user.id) &&
    (!@current_user.pseudonym.match?(/^anonymous$/i))
  end
end
