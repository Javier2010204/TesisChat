require 'test_helper'

class ExtensionOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extension_order = extension_orders(:one)
  end

  test "should get index" do
    get extension_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_extension_order_url
    assert_response :success
  end

  test "should create extension_order" do
    assert_difference('ExtensionOrder.count') do
      post extension_orders_url, params: { extension_order: { extension_date: @extension_order.extension_date, order_id: @extension_order.order_id, receiver_id: @extension_order.receiver_id, user_id: @extension_order.user_id } }
    end

    assert_redirected_to extension_order_url(ExtensionOrder.last)
  end

  test "should show extension_order" do
    get extension_order_url(@extension_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_extension_order_url(@extension_order)
    assert_response :success
  end

  test "should update extension_order" do
    patch extension_order_url(@extension_order), params: { extension_order: { extension_date: @extension_order.extension_date, order_id: @extension_order.order_id, receiver_id: @extension_order.receiver_id, user_id: @extension_order.user_id } }
    assert_redirected_to extension_order_url(@extension_order)
  end

  test "should destroy extension_order" do
    assert_difference('ExtensionOrder.count', -1) do
      delete extension_order_url(@extension_order)
    end

    assert_redirected_to extension_orders_url
  end
end
