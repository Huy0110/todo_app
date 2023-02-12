require "application_system_test_case"

class ListCommentsTest < ApplicationSystemTestCase
  setup do
    @list_comment = list_comments(:one)
  end

  test "visiting the index" do
    visit list_comments_url
    assert_selector "h1", text: "List Comments"
  end

  test "creating a List comment" do
    visit list_comments_url
    click_on "New List Comment"

    fill_in "Comment", with: @list_comment.comment
    fill_in "List", with: @list_comment.list_id
    fill_in "User", with: @list_comment.user_id
    click_on "Create List comment"

    assert_text "List comment was successfully created"
    click_on "Back"
  end

  test "updating a List comment" do
    visit list_comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @list_comment.comment
    fill_in "List", with: @list_comment.list_id
    fill_in "User", with: @list_comment.user_id
    click_on "Update List comment"

    assert_text "List comment was successfully updated"
    click_on "Back"
  end

  test "destroying a List comment" do
    visit list_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "List comment was successfully destroyed"
  end
end
