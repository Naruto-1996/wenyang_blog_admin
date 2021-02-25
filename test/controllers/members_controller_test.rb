require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get members_sign_in_url
    assert_response :success
  end

end
