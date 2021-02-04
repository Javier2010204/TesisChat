require 'test_helper'

class HomeworkReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homework_review = homework_reviews(:one)
  end

  test "should get index" do
    get homework_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_homework_review_url
    assert_response :success
  end

  test "should create homework_review" do
    assert_difference('HomeworkReview.count') do
      post homework_reviews_url, params: { homework_review: { editor_id: @homework_review.editor_id, homework_id: @homework_review.homework_id, status: @homework_review.status } }
    end

    assert_redirected_to homework_review_url(HomeworkReview.last)
  end

  test "should show homework_review" do
    get homework_review_url(@homework_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_homework_review_url(@homework_review)
    assert_response :success
  end

  test "should update homework_review" do
    patch homework_review_url(@homework_review), params: { homework_review: { editor_id: @homework_review.editor_id, homework_id: @homework_review.homework_id, status: @homework_review.status } }
    assert_redirected_to homework_review_url(@homework_review)
  end

  test "should destroy homework_review" do
    assert_difference('HomeworkReview.count', -1) do
      delete homework_review_url(@homework_review)
    end

    assert_redirected_to homework_reviews_url
  end
end
