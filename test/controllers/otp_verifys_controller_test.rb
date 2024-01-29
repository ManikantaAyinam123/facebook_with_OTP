require "test_helper"

class OtpVerifysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get otp_verifys_index_url
    assert_response :success
  end

  test "should get show" do
    get otp_verifys_show_url
    assert_response :success
  end

  test "should get new" do
    get otp_verifys_new_url
    assert_response :success
  end
end
