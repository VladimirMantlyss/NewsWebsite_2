require "test_helper"

class CommentarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commentar = commentars(:one)
  end

  test "should get index" do
    get commentars_url
    assert_response :success
  end

  test "should get new" do
    get new_commentar_url
    assert_response :success
  end

  test "should create commentar" do
    assert_difference("Commentar.count") do
      post commentars_url, params: { commentar: { comentar_text: @commentar.comentar_text, user_id: @commentar.user_id } }
    end

    assert_redirected_to commentar_url(Commentar.last)
  end

  test "should show commentar" do
    get commentar_url(@commentar)
    assert_response :success
  end

  test "should get edit" do
    get edit_commentar_url(@commentar)
    assert_response :success
  end

  test "should update commentar" do
    patch commentar_url(@commentar), params: { commentar: { comentar_text: @commentar.comentar_text, user_id: @commentar.user_id } }
    assert_redirected_to commentar_url(@commentar)
  end

  test "should destroy commentar" do
    assert_difference("Commentar.count", -1) do
      delete commentar_url(@commentar)
    end

    assert_redirected_to commentars_url
  end
end
