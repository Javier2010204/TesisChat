require "application_system_test_case"

class ExtensionsTest < ApplicationSystemTestCase
  setup do
    @extension = extensions(:one)
  end

  test "visiting the index" do
    visit extensions_url
    assert_selector "h1", text: "Extensions"
  end

  test "creating a Extension" do
    visit extensions_url
    click_on "New Extension"

    fill_in "Chat", with: @extension.chat_id
    fill_in "Date", with: @extension.date
    fill_in "Receiver", with: @extension.receiver_id
    fill_in "Status", with: @extension.status
    fill_in "User", with: @extension.user_id
    click_on "Create Extension"

    assert_text "Extension was successfully created"
    click_on "Back"
  end

  test "updating a Extension" do
    visit extensions_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @extension.chat_id
    fill_in "Date", with: @extension.date
    fill_in "Receiver", with: @extension.receiver_id
    fill_in "Status", with: @extension.status
    fill_in "User", with: @extension.user_id
    click_on "Update Extension"

    assert_text "Extension was successfully updated"
    click_on "Back"
  end

  test "destroying a Extension" do
    visit extensions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Extension was successfully destroyed"
  end
end
