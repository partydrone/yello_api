require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_path, as: :json
    assert_response :success
  end

  test "should get show" do
    get book_path(books(:one)), as: :json
    assert_response :success
  end

  test "should create a new book" do
    assert_difference("Book.count") do
      post books_path, params: {
        book: {
          author_id: users(:one).id,
          description: "Super exciting book",
          price: 12.99,
          title: "New Book"
        } },
        as: :json
    end

    assert_response :created
  end

  test "should update a book" do
    book = books(:one)
    old_title = book.title
    put book_path(book), params: { title: "New Title" }, as: :json
    book.reload

    assert_equal "New Title", book.title
  end

  test "should delete a book" do
    assert_difference("Book.count", -1) do
      delete book_path(books(:one)), as: :json
    end

    assert_response :no_content
  end

  test "should unpublish a book" do
    delete unpublish_book_path(books(:one)), as: :json

    assert_response :ok
  end
end
