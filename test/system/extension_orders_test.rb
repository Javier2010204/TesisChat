require "application_system_test_case"

class ExtensionOrdersTest < ApplicationSystemTestCase
  setup do
    @extension_order = extension_orders(:one)
  end

  test "visiting the index" do
    visit extension_orders_url
    assert_selector "h1", text: "Extension Orders"
  end

  test "creating a Extension order" do
    visit extension_orders_url
    click_on "New Extension Order"

    fill_in "Extension date", with: @extension_order.extension_date
    fill_in "Order", with: @extension_order.order_id
    fill_in "Receiver", with: @extension_order.receiver_id
    fill_in "User", with: @extension_order.user_id
    click_on "Create Extension order"

    assert_text "Extension order was successfully created"
    click_on "Back"
  end

  test "updating a Extension order" do
    visit extension_orders_url
    click_on "Edit", match: :first

    fill_in "Extension date", with: @extension_order.extension_date
    fill_in "Order", with: @extension_order.order_id
    fill_in "Receiver", with: @extension_order.receiver_id
    fill_in "User", with: @extension_order.user_id
    click_on "Update Extension order"

    assert_text "Extension order was successfully updated"
    click_on "Back"
  end

  test "destroying a Extension order" do
    visit extension_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Extension order was successfully destroyed"
  end
end
