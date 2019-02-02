require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  #sign_in_as(@user, "password")
  test 'get new category form and category' do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'Alpha-Blog' } }
    end

    assert_template 'categories/index'
    assert_match 'Alpha-Blog', response.body
  end

  test 'invalid category submission results in failure' do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: '' } }
    end

    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end
