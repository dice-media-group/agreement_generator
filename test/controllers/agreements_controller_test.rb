require 'test_helper'

class AgreementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agreement = agreements(:one)
  end

  test "should get index" do
    get agreements_url
    assert_response :success
  end

  test "should get new" do
    get new_agreement_url
    assert_response :success
  end

  test "should create agreement" do
    assert_difference('Agreement.count') do
      post agreements_url, params: { agreement: { client_rep_name: @agreement.client_rep_name, client_rep_signature: @agreement.client_rep_signature, client_signed_on: @agreement.client_signed_on, document_id: @agreement.document_id, provider_rep_name: @agreement.provider_rep_name, provider_signature: @agreement.provider_signature, provider_signed_on: @agreement.provider_signed_on, signature: @agreement.signature, signed_on: @agreement.signed_on, user_id: @agreement.user_id } }
    end

    assert_redirected_to agreement_url(Agreement.last)
  end

  test "should show agreement" do
    get agreement_url(@agreement)
    assert_response :success
  end

  test "should get edit" do
    get edit_agreement_url(@agreement)
    assert_response :success
  end

  test "should update agreement" do
    patch agreement_url(@agreement), params: { agreement: { client_rep_name: @agreement.client_rep_name, client_rep_signature: @agreement.client_rep_signature, client_signed_on: @agreement.client_signed_on, document_id: @agreement.document_id, provider_rep_name: @agreement.provider_rep_name, provider_signature: @agreement.provider_signature, provider_signed_on: @agreement.provider_signed_on, signature: @agreement.signature, signed_on: @agreement.signed_on, user_id: @agreement.user_id } }
    assert_redirected_to agreement_url(@agreement)
  end

  test "should destroy agreement" do
    assert_difference('Agreement.count', -1) do
      delete agreement_url(@agreement)
    end

    assert_redirected_to agreements_url
  end
end
