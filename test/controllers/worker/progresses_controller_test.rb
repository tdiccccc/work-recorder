require "test_helper"

class Worker::ProgressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get worker_progresses_new_url
    assert_response :success
  end

  test "should get index" do
    get worker_progresses_index_url
    assert_response :success
  end
end
