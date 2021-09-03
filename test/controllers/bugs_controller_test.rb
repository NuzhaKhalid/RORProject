require 'test_helper'

class BugsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @bug = bugs(:one)
  end

  test "should get index" do
    get :index, params: { project_id: @project }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { project_id: @project }
    assert_response :success
  end

  test "should create bug" do
    assert_difference('Bug.count') do
      post :create, params: { project_id: @project, bug: @bug.attributes }
    end

    assert_redirected_to project_bug_path(@project, Bug.last)
  end

  test "should show bug" do
    get :show, params: { project_id: @project, id: @bug }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { project_id: @project, id: @bug }
    assert_response :success
  end

  test "should update bug" do
    put :update, params: { project_id: @project, id: @bug, bug: @bug.attributes }
    assert_redirected_to project_bug_path(@project, Bug.last)
  end

  test "should destroy bug" do
    assert_difference('Bug.count', -1) do
      delete :destroy, params: { project_id: @project, id: @bug }
    end

    assert_redirected_to project_bugs_path(@project)
  end
end
