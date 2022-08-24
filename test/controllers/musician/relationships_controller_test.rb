require "test_helper"

class Musician::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get musician_relationships_index_url
    assert_response :success
  end
end
