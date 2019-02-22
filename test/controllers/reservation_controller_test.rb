require 'test_helper'

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get Mailer" do
    get reservation_Mailer_url
    assert_response :success
  end

end
