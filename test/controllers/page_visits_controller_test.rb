require 'test_helper'

class PageVisitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_visit = page_visits(:one)
  end

  test "should get index" do
    get page_visits_url
    assert_response :success
  end

  test "should get new" do
    get new_page_visit_url
    assert_response :success
  end

  test "should create page_visit" do
    assert_difference('PageVisit.count') do
      post page_visits_url, params: { page_visit: { page_id: @page_visit.page_id, user_id: @page_visit.user_id, visitdate: @page_visit.visitdate } }
    end

    assert_redirected_to page_visit_url(PageVisit.last)
  end

  test "should show page_visit" do
    get page_visit_url(@page_visit)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_visit_url(@page_visit)
    assert_response :success
  end

  test "should update page_visit" do
    patch page_visit_url(@page_visit), params: { page_visit: { page_id: @page_visit.page_id, user_id: @page_visit.user_id, visitdate: @page_visit.visitdate } }
    assert_redirected_to page_visit_url(@page_visit)
  end

  test "should destroy page_visit" do
    assert_difference('PageVisit.count', -1) do
      delete page_visit_url(@page_visit)
    end

    assert_redirected_to page_visits_url
  end
end
