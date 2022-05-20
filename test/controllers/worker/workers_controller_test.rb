require "test_helper"

class Worker::WorkersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get worker_workers_edit_url
    assert_response :success
  end

  test "should get index" do
    get worker_workers_index_url
    assert_response :success
  end

  test "should get show" do
    get worker_workers_show_url
    assert_response :success
  end
end
