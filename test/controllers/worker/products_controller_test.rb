require "test_helper"

class Worker::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get worker_products_index_url
    assert_response :success
  end

  test "should get show" do
    get worker_products_show_url
    assert_response :success
  end
end
