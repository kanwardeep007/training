require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get about_method" do
    get about_about_method_url
    assert_response :success
  end

end
