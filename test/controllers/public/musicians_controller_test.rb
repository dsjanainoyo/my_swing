require "test_helper"

class Public::MusiciansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_musicians_index_url
    assert_response :success
  end

  test "should get show" do
    get public_musicians_show_url
    assert_response :success
  end
end
