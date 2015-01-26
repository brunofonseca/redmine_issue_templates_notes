require 'test_helper'

class IssueTemplatesNotesControllerTest < ActionController::TestCase
  setup do
    @issue_templates_note = issue_templates_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_templates_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_templates_note" do
    assert_difference('IssueTemplatesNote.count') do
      post :create, issue_templates_note: {  }
    end

    assert_redirected_to issue_templates_note_path(assigns(:issue_templates_note))
  end

  test "should show issue_templates_note" do
    get :show, id: @issue_templates_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_templates_note
    assert_response :success
  end

  test "should update issue_templates_note" do
    put :update, id: @issue_templates_note, issue_templates_note: {  }
    assert_redirected_to issue_templates_note_path(assigns(:issue_templates_note))
  end

  test "should destroy issue_templates_note" do
    assert_difference('IssueTemplatesNote.count', -1) do
      delete :destroy, id: @issue_templates_note
    end

    assert_redirected_to issue_templates_notes_path
  end
end
