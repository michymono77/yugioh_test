require 'test_helper'

class StructuresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get structures_new_url
    assert_response :success
  end

end
