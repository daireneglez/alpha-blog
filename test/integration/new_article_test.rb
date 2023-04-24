require "test_helper"

class NewArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "johndoe", email: "johndoe@examle.com", password: "password", admin: false)
    @category = Category.create(name: "Programming")
    sign_in_as(@user)
  end

  test "get new article form and create article successfully" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {
        title: "Test article",
        description: "Desc for Testing article",
        category_ids: [@category.id]
      } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Test article", response.body
  end
end
