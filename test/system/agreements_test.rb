require "application_system_test_case"

class AgreementsTest < ApplicationSystemTestCase
  setup do
    @agreement = agreements(:one)
  end

  test "visiting the index" do
    visit agreements_url
    assert_selector "h1", text: "Agreements"
  end

  test "creating a Agreement" do
    visit agreements_url
    click_on "New Agreement"

    fill_in "Client rep name", with: @agreement.client_rep_name
    fill_in "Client rep signature", with: @agreement.client_rep_signature
    fill_in "Client signed on", with: @agreement.client_signed_on
    fill_in "Document", with: @agreement.document_id
    fill_in "Provider rep name", with: @agreement.provider_rep_name
    fill_in "Provider signature", with: @agreement.provider_signature
    fill_in "Provider signed on", with: @agreement.provider_signed_on
    fill_in "Signature", with: @agreement.signature
    fill_in "Signed on", with: @agreement.signed_on
    fill_in "User", with: @agreement.user_id
    click_on "Create Agreement"

    assert_text "Agreement was successfully created"
    click_on "Back"
  end

  test "updating a Agreement" do
    visit agreements_url
    click_on "Edit", match: :first

    fill_in "Client rep name", with: @agreement.client_rep_name
    fill_in "Client rep signature", with: @agreement.client_rep_signature
    fill_in "Client signed on", with: @agreement.client_signed_on
    fill_in "Document", with: @agreement.document_id
    fill_in "Provider rep name", with: @agreement.provider_rep_name
    fill_in "Provider signature", with: @agreement.provider_signature
    fill_in "Provider signed on", with: @agreement.provider_signed_on
    fill_in "Signature", with: @agreement.signature
    fill_in "Signed on", with: @agreement.signed_on
    fill_in "User", with: @agreement.user_id
    click_on "Update Agreement"

    assert_text "Agreement was successfully updated"
    click_on "Back"
  end

  test "destroying a Agreement" do
    visit agreements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Agreement was successfully destroyed"
  end
end
