require 'test_helper'

class PaymentSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_schedule = payment_schedules(:one)
  end

  test "should get index" do
    get payment_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_schedule_url
    assert_response :success
  end

  test "should create payment_schedule" do
    assert_difference('PaymentSchedule.count') do
      post payment_schedules_url, params: { payment_schedule: { document_id: @payment_schedule.document_id } }
    end

    assert_redirected_to payment_schedule_url(PaymentSchedule.last)
  end

  test "should show payment_schedule" do
    get payment_schedule_url(@payment_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_schedule_url(@payment_schedule)
    assert_response :success
  end

  test "should update payment_schedule" do
    patch payment_schedule_url(@payment_schedule), params: { payment_schedule: { document_id: @payment_schedule.document_id } }
    assert_redirected_to payment_schedule_url(@payment_schedule)
  end

  test "should destroy payment_schedule" do
    assert_difference('PaymentSchedule.count', -1) do
      delete payment_schedule_url(@payment_schedule)
    end

    assert_redirected_to payment_schedules_url
  end
end
