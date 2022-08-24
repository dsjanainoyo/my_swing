require "test_helper"

class Musician::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get musician_events_index_url
    assert_response :success
  end

  test "should get show" do
    get musician_events_show_url
    assert_response :success
  end

  test "should get new" do
    get musician_events_new_url
    assert_response :success
  end

  test "should get create" do
    get musician_events_create_url
    assert_response :success
  end

  test "should get edit" do
    get musician_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get musician_events_update_url
    assert_response :success
  end
end
