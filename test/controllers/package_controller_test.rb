require 'test_helper'

class PackageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get package_index_url
    assert_response :success
  end

end
