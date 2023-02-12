require 'test_helper'

class ListCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_comment = list_comments(:one)
  end

  test "should get index" do
    get list_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_list_comment_url
    assert_response :success
  end

  test "should create list_comment" do
    assert_difference('ListComment.count') do
      post list_comments_url, params: { list_comment: { comment: @list_comment.comment, list_id: @list_comment.list_id, user_id: @list_comment.user_id } }
    end

    assert_redirected_to list_comment_url(ListComment.last)
  end

  test "should show list_comment" do
    get list_comment_url(@list_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_comment_url(@list_comment)
    assert_response :success
  end

  test "should update list_comment" do
    patch list_comment_url(@list_comment), params: { list_comment: { comment: @list_comment.comment, list_id: @list_comment.list_id, user_id: @list_comment.user_id } }
    assert_redirected_to list_comment_url(@list_comment)
  end

  test "should destroy list_comment" do
    assert_difference('ListComment.count', -1) do
      delete list_comment_url(@list_comment)
    end

    assert_redirected_to list_comments_url
  end
end
