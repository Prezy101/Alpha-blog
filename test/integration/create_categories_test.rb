require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "get new category form and category" do

    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Prez" } }

    end

    assert_template 'categories/index'
    assert_match "Prez", response.body
  end

end