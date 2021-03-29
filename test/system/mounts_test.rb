require "application_system_test_case"

class MountsTest < ApplicationSystemTestCase
  setup do
    @mount = mounts(:one)
  end

  test "visiting the index" do
    visit mounts_url
    assert_selector "h1", text: "Mounts"
  end

  test "creating a Mount" do
    visit mounts_url
    click_on "New Mount"

    fill_in "Date", with: @mount.date
    fill_in "Quantity", with: @mount.quantity
    fill_in "User", with: @mount.user_id
    click_on "Create Mount"

    assert_text "Mount was successfully created"
    click_on "Back"
  end

  test "updating a Mount" do
    visit mounts_url
    click_on "Edit", match: :first

    fill_in "Date", with: @mount.date
    fill_in "Quantity", with: @mount.quantity
    fill_in "User", with: @mount.user_id
    click_on "Update Mount"

    assert_text "Mount was successfully updated"
    click_on "Back"
  end

  test "destroying a Mount" do
    visit mounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mount was successfully destroyed"
  end
end
