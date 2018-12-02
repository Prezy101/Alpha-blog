require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "get new category form and category" do

    get new_category_path
  end

end