require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_url, headers: { "Accept" => "application/json" }
    assert_response :success
  end

  test "should get show" do
    get book_url(books(:one)), headers: { "Accept" => "application/json" }
    assert_response :success
  end

  test "should create a new book" do
    assert_difference("Book.count") do
      post books_url, params: {
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
    put book_url(books(:one)), params: { title: "New Title" }, as: :json
    book.reload

    assert_equal "New Title", book.title
  end

  test "should delete a book" do
    assert_difference("Book.count", -1) do
      delete book_url(books(:one)), as: :json
    end

    assert_response :no_content
  end

  test "should render JSON" do
    get books_url, headers: { "Accept" => "application/json" }

    assert_equal response.body, Book.all.to_json(include: :author, except: :author_id)
  end

  test "should render XML" do
    get books_url, headers: { "Accept" => "application/xml" }

    assert_equal response.body, Book.all.as_json(include: :author, except: :author_id).to_xml
  end
end
