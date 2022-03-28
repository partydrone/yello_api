require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = JsonWebToken.encode(sub: users(:one).id)
  end

  test "should get index" do
    get books_path, as: :json
    assert_response :success
  end

  test "should return all records when no params are passed" do
    get books_path, as: :json

    assert_equal Book.count, JSON.parse(response.body).size
  end

  test "should search by title" do
    get books_path, params: { title: "One" }, as: :json

    assert_equal JSON.parse(response.body).size, Book.search("One").size
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
        as: :json, headers: { "Authorization": "Bearer #{@token}" }
    end

    assert_response :created
  end

  test "should update a book" do
    book = books(:one)
    old_title = book.title
    put book_path(book), params: { title: "New Title" }, as: :json, headers: { "Authorization": "Bearer #{@token}" }
    book.reload

    assert_equal "New Title", book.title
  end

  test "should delete a book" do
    assert_difference("Book.count", -1) do
      delete book_path(books(:one)), as: :json, headers: { "Authorization": "Bearer #{@token}" }
    end

    assert_response :no_content
  end

  test "should unpublish a book" do
    delete unpublish_book_path(books(:one)), as: :json, headers: { "Authorization": "Bearer #{@token}" }

    assert_response :ok
  end

  test "should prevent access to protected actions" do
    delete book_path(books(:one)), as: :json

    assert_response :unauthorized
  end

  test "should prevent user from publishing for someone else" do
    assert_no_difference("Book.count") do
      post books_path, params: {
        book: {
          author_id: users(:two).id,
          description: "Super exciting book",
          price: 12.99,
          title: "New Book"
        } },
        as: :json, headers: { "Authorization": "Bearer #{@token}" }
    end

    assert_response :unprocessable_entity
  end

  test "should prevent user from unpublishing for someone else" do
    assert_no_difference("Book.count") do
      delete unpublish_book_path(books(:two)), as: :json, headers: { "Authorization": "Bearer #{@token}" }
    end

    assert_response :unprocessable_entity
  end

  test "should prevent anonymous user from publishing" do
    token = JsonWebToken.encode(sub: users(:anonymous).id)

    assert_no_difference("Book.count") do
      post books_path, params: {
        book: {
          author_id: users(:anonymous).id,
          description: "Super exciting book",
          price: 12.99,
          title: "New Book"
        } },
        as: :json, headers: { "Authorization": "Bearer #{token}" }
    end

    assert_response :unprocessable_entity
  end
end
