require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get questions_new_url
    assert_response :success
  end

end
