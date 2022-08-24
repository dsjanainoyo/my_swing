require "test_helper"

class Musician::MusiciansControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get musician_musicians_show_url
    assert_response :success
  end

  test "should get edit" do
    get musician_musicians_edit_url
    assert_response :success
  end

  test "should get update" do
    get musician_musicians_update_url
    assert_response :success
  end
end
