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
end
