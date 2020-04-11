require 'test_helper'

class ShopersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shopers_index_url
    assert_response :success
  end

  test "should get new" do
    get shopers_new_url
    assert_response :success
  end

  test "should get show" do
    get shopers_show_url
    assert_response :success
  end

  test "should get edit" do
    get shopers_edit_url
    assert_response :success
  end

end
