require "application_system_test_case"

class HomeworkReviewsTest < ApplicationSystemTestCase
  setup do
    @homework_review = homework_reviews(:one)
  end

  test "visiting the index" do
    visit homework_reviews_url
    assert_selector "h1", text: "Homework Reviews"
  end

  test "creating a Homework review" do
    visit homework_reviews_url
    click_on "New Homework Review"

    fill_in "Editor", with: @homework_review.editor_id
    fill_in "Homework", with: @homework_review.homework_id
    fill_in "Status", with: @homework_review.status
    click_on "Create Homework review"

    assert_text "Homework review was successfully created"
    click_on "Back"
  end

  test "updating a Homework review" do
    visit homework_reviews_url
    click_on "Edit", match: :first

    fill_in "Editor", with: @homework_review.editor_id
    fill_in "Homework", with: @homework_review.homework_id
    fill_in "Status", with: @homework_review.status
    click_on "Update Homework review"

    assert_text "Homework review was successfully updated"
    click_on "Back"
  end

  test "destroying a Homework review" do
    visit homework_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Homework review was successfully destroyed"
  end
end
