require 'test_helper'

class AgreementPreviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get agreement_previews_show_url
    assert_response :success
  end

end
