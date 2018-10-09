require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get reportlist" do
    get reports_reportlist_url
    assert_response :success
  end

  test "should get custlist" do
    get reports_custlist_url
    assert_response :success
  end

  test "should get productlist" do
    get reports_productlist_url
    assert_response :success
  end

  test "should get salelist" do
    get reports_salelist_url
    assert_response :success
  end

end
