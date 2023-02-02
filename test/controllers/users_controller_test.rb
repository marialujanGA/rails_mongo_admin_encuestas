require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { course_code: @user.course_code, email: @user.email, exit_active: @user.exit_active, exit_answered: @user.exit_answered, initial_active: @user.initial_active, initial_answered: @user.initial_answered, midterm_active: @user.midterm_active, midterm_answered: @user.midterm_answered, name: @user.name, sis_id: @user.sis_id, university: @user.university } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { course_code: @user.course_code, email: @user.email, exit_active: @user.exit_active, exit_answered: @user.exit_answered, initial_active: @user.initial_active, initial_answered: @user.initial_answered, midterm_active: @user.midterm_active, midterm_answered: @user.midterm_answered, name: @user.name, sis_id: @user.sis_id, university: @user.university } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
