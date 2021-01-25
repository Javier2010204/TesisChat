require "application_system_test_case"

class ProgressesTest < ApplicationSystemTestCase
  setup do
    @progress = progresses(:one)
  end

  test "visiting the index" do
    visit progresses_url
    assert_selector "h1", text: "Progresses"
  end

  test "creating a Progress" do
    visit progresses_url
    click_on "New Progress"

    fill_in "Body", with: @progress.body
    fill_in "User", with: @progress.user_id
    click_on "Create Progress"

    assert_text "Progress was successfully created"
    click_on "Back"
  end

  test "updating a Progress" do
    visit progresses_url
    click_on "Edit", match: :first

    fill_in "Body", with: @progress.body
    fill_in "User", with: @progress.user_id
    click_on "Update Progress"

    assert_text "Progress was successfully updated"
    click_on "Back"
  end

  test "destroying a Progress" do
    visit progresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Progress was successfully destroyed"
  end
end
