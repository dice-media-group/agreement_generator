require 'test_helper'

class ScopeDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scope_document = scope_documents(:one)
  end

  test "should get index" do
    get scope_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_scope_document_url
    assert_response :success
  end

  test "should create scope_document" do
    assert_difference('ScopeDocument.count') do
      post scope_documents_url, params: { scope_document: { document_id: @scope_document.document_id, project_name: @scope_document.project_name } }
    end

    assert_redirected_to scope_document_url(ScopeDocument.last)
  end

  test "should show scope_document" do
    get scope_document_url(@scope_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_scope_document_url(@scope_document)
    assert_response :success
  end

  test "should update scope_document" do
    patch scope_document_url(@scope_document), params: { scope_document: { document_id: @scope_document.document_id, project_name: @scope_document.project_name } }
    assert_redirected_to scope_document_url(@scope_document)
  end

  test "should destroy scope_document" do
    assert_difference('ScopeDocument.count', -1) do
      delete scope_document_url(@scope_document)
    end

    assert_redirected_to scope_documents_url
  end
end
