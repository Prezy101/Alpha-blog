require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  #sign_in_as(@user, "password")

  def setup
    @categories = Category.create(name: "Programming")
    @categories2 = Category.create(name: "Trading")

  end

  test "Should list all my categories" do

    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", categories_path(@categories), text: @categories.name
    assert_select "a[href=?]", categories_path(@categories2), text: @categories2.name


  end



end
