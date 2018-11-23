require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
  end


  test "should get categories index" do

    get :categories_path
    assert_response :success
  end

  test "should get new" do

    get :new_categories_path
    assert_response :success


  end

  test "should get show" do

    get :show_categories_path
    assert_response :success



  end
end