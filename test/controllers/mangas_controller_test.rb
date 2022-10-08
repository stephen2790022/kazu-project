require 'test_helper'

class MangasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mangas_index_url
    assert_response :success
  end

  test "should get show" do
    get mangas_show_url
    assert_response :success
  end

  test "should get edit" do
    get mangas_edit_url
    assert_response :success
  end

  test "should get create" do
    get mangas_create_url
    assert_response :success
  end

  test "should get new" do
    get mangas_new_url
    assert_response :success
  end

  test "should get update" do
    get mangas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get mangas_destroy_url
    assert_response :success
  end

end
