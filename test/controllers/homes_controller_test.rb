require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homes_index_url
    assert_response :success
  end

  test "should get show" do
    get homes_show_url
    assert_response :success
  end

  test "should get question" do
    get homes_question_url
    assert_response :success
  end

  test "should get contact" do
    get homes_contact_url
    assert_response :success
  end

end
