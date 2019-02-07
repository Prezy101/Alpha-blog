require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
  end


  test "should get categories index" do

    get '/categories'
    assert_response :success
  end


end