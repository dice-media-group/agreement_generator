require "application_system_test_case"

class PaymentSchedulesTest < ApplicationSystemTestCase
  setup do
    @payment_schedule = payment_schedules(:one)
  end

  test "visiting the index" do
    visit payment_schedules_url
    assert_selector "h1", text: "Payment Schedules"
  end

  test "creating a Payment schedule" do
    visit payment_schedules_url
    click_on "New Payment Schedule"

    fill_in "Document", with: @payment_schedule.document_id
    click_on "Create Payment schedule"

    assert_text "Payment schedule was successfully created"
    click_on "Back"
  end

  test "updating a Payment schedule" do
    visit payment_schedules_url
    click_on "Edit", match: :first

    fill_in "Document", with: @payment_schedule.document_id
    click_on "Update Payment schedule"

    assert_text "Payment schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment schedule" do
    visit payment_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment schedule was successfully destroyed"
  end
end
