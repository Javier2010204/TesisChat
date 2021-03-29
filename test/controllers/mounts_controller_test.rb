require 'test_helper'

class MountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mount = mounts(:one)
  end

  test "should get index" do
    get mounts_url
    assert_response :success
  end

  test "should get new" do
    get new_mount_url
    assert_response :success
  end

  test "should create mount" do
    assert_difference('Mount.count') do
      post mounts_url, params: { mount: { date: @mount.date, quantity: @mount.quantity, user_id: @mount.user_id } }
    end

    assert_redirected_to mount_url(Mount.last)
  end

  test "should show mount" do
    get mount_url(@mount)
    assert_response :success
  end

  test "should get edit" do
    get edit_mount_url(@mount)
    assert_response :success
  end

  test "should update mount" do
    patch mount_url(@mount), params: { mount: { date: @mount.date, quantity: @mount.quantity, user_id: @mount.user_id } }
    assert_redirected_to mount_url(@mount)
  end

  test "should destroy mount" do
    assert_difference('Mount.count', -1) do
      delete mount_url(@mount)
    end

    assert_redirected_to mounts_url
  end
end
