require "test_helper"

class TheaterCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get theater_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get theater_comments_destroy_url
    assert_response :success
  end
end
