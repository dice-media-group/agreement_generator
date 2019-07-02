require "application_system_test_case"

class ScopeDocumentsTest < ApplicationSystemTestCase
  setup do
    @scope_document = scope_documents(:one)
  end

  test "visiting the index" do
    visit scope_documents_url
    assert_selector "h1", text: "Scope Documents"
  end

  test "creating a Scope document" do
    visit scope_documents_url
    click_on "New Scope Document"

    fill_in "Document", with: @scope_document.document_id
    fill_in "Project name", with: @scope_document.project_name
    click_on "Create Scope document"

    assert_text "Scope document was successfully created"
    click_on "Back"
  end

  test "updating a Scope document" do
    visit scope_documents_url
    click_on "Edit", match: :first

    fill_in "Document", with: @scope_document.document_id
    fill_in "Project name", with: @scope_document.project_name
    click_on "Update Scope document"

    assert_text "Scope document was successfully updated"
    click_on "Back"
  end

  test "destroying a Scope document" do
    visit scope_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scope document was successfully destroyed"
  end
end
