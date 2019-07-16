require 'test_helper'

class CrmDocsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crm_docs_index_url
    assert_response :success
  end

end
