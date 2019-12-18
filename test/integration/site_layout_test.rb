require 'test_helper'


class SiteLayoutTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:user1)
  end

  test "layout links" do
    # Tests before login
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", new_user_session_path
    get new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", new_user_password_path
    get next7days_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", new_user_session_path


    # Tests after login
    get new_user_session_path
    sign_in @user
    get root_path
    assert_select "a[href=?]", new_user_session_path, count: 0
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", next7days_path
    get root_path
    #assert_select "h1", "Today"
    get next7days_path
    assert_select "h1", "Next 7 days"
  end

end
