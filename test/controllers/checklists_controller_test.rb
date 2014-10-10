require 'test_helper'

class ChecklistsControllerTest < ActionController::TestCase
  setup do
    @checklist = checklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checklist" do
    assert_difference('Checklist.count') do
      post :create, checklist: { allow_robots: @checklist.allow_robots, analytics: @checklist.analytics, contact_forms: @checklist.contact_forms, css_compressed: @checklist.css_compressed, google_site_map: @checklist.google_site_map, javascript_compressed: @checklist.javascript_compressed, permalinks: @checklist.permalinks, redirects: @checklist.redirects, site_id: @checklist.site_id, site_url: @checklist.site_url }
    end

    assert_redirected_to checklist_path(assigns(:checklist))
  end

  test "should show checklist" do
    get :show, id: @checklist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checklist
    assert_response :success
  end

  test "should update checklist" do
    patch :update, id: @checklist, checklist: { allow_robots: @checklist.allow_robots, analytics: @checklist.analytics, contact_forms: @checklist.contact_forms, css_compressed: @checklist.css_compressed, google_site_map: @checklist.google_site_map, javascript_compressed: @checklist.javascript_compressed, permalinks: @checklist.permalinks, redirects: @checklist.redirects, site_id: @checklist.site_id, site_url: @checklist.site_url }
    assert_redirected_to checklist_path(assigns(:checklist))
  end

  test "should destroy checklist" do
    assert_difference('Checklist.count', -1) do
      delete :destroy, id: @checklist
    end

    assert_redirected_to checklists_path
  end
end
