require 'test_helper'

class FoodanswersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get foodanswers_edit_url
    assert_response :success
  end

end
