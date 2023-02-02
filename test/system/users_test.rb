require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Course code", with: @user.course_code
    fill_in "Email", with: @user.email
    check "Exit active" if @user.exit_active
    check "Exit answered" if @user.exit_answered
    check "Initial active" if @user.initial_active
    check "Initial answered" if @user.initial_answered
    check "Midterm active" if @user.midterm_active
    check "Midterm answered" if @user.midterm_answered
    fill_in "Name", with: @user.name
    fill_in "Sis", with: @user.sis_id
    fill_in "University", with: @user.university
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Course code", with: @user.course_code
    fill_in "Email", with: @user.email
    check "Exit active" if @user.exit_active
    check "Exit answered" if @user.exit_answered
    check "Initial active" if @user.initial_active
    check "Initial answered" if @user.initial_answered
    check "Midterm active" if @user.midterm_active
    check "Midterm answered" if @user.midterm_answered
    fill_in "Name", with: @user.name
    fill_in "Sis", with: @user.sis_id
    fill_in "University", with: @user.university
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
