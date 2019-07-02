require "application_system_test_case"

class ContactDetailsTest < ApplicationSystemTestCase
  setup do
    @contact_detail = contact_details(:one)
  end

  test "visiting the index" do
    visit contact_details_url
    assert_selector "h1", text: "Contact Details"
  end

  test "creating a Contact detail" do
    visit contact_details_url
    click_on "New Contact Detail"

    fill_in "Business city", with: @contact_detail.business_city
    fill_in "Business name", with: @contact_detail.business_name
    fill_in "Business phone", with: @contact_detail.business_phone
    fill_in "Business postal code", with: @contact_detail.business_postal_code
    fill_in "Business state", with: @contact_detail.business_state
    fill_in "Business street address 02", with: @contact_detail.business_street_address_02
    fill_in "Name of representative", with: @contact_detail.name_of_representative
    fill_in "Street address 01", with: @contact_detail.street_address_01
    click_on "Create Contact detail"

    assert_text "Contact detail was successfully created"
    click_on "Back"
  end

  test "updating a Contact detail" do
    visit contact_details_url
    click_on "Edit", match: :first

    fill_in "Business city", with: @contact_detail.business_city
    fill_in "Business name", with: @contact_detail.business_name
    fill_in "Business phone", with: @contact_detail.business_phone
    fill_in "Business postal code", with: @contact_detail.business_postal_code
    fill_in "Business state", with: @contact_detail.business_state
    fill_in "Business street address 02", with: @contact_detail.business_street_address_02
    fill_in "Name of representative", with: @contact_detail.name_of_representative
    fill_in "Street address 01", with: @contact_detail.street_address_01
    click_on "Update Contact detail"

    assert_text "Contact detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact detail" do
    visit contact_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact detail was successfully destroyed"
  end
end
