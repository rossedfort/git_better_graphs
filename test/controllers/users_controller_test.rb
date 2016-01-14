require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "#show" do
    get :show, id: 'rossedfort'

    assert_response :success
  end
end
