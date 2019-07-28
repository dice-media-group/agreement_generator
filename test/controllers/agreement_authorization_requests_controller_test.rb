require 'test_helper'

class AgreementAuthorizationRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get agreement_authorization_requests_create_url
    assert_response :success
  end

end
