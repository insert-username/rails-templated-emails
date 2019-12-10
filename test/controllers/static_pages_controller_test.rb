require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about message" do
    get about_url
    assert :success
  end
end
