require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | Course Catalog"
  end

  test "should get subjects" do
    get subjects_url
    assert_response :success
    assert_select "title", "Subjects | Course Catalog"
  end


    test "should get courses" do
      get courses_url
      assert_response :success
      assert_select "title", "Courses | Course Catalog"
    end


    test "should get instructors" do
      get instructors_url
      assert_response :success
      assert_select "title", "Instructors | Course Catalog"

    end





end
