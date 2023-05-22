require "test_helper"

class CommetarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commetar = commetars(:one)
  end

  test "should get index" do
    get commetars_url
    assert_response :success
  end

  test "should get new" do
    get new_commetar_url
    assert_response :success
  end

  test "should create commetar" do
    assert_difference("Commetar.count") do
      post commetars_url, params: { commetar: { comentar_text: @commetar.comentar_text, user_id: @commetar.user_id } }
    end

    assert_redirected_to commetar_url(Commetar.last)
  end

  test "should show commetar" do
    get commetar_url(@commetar)
    assert_response :success
  end

  test "should get edit" do
    get edit_commetar_url(@commetar)
    assert_response :success
  end

  test "should update commetar" do
    patch commetar_url(@commetar), params: { commetar: { comentar_text: @commetar.comentar_text, user_id: @commetar.user_id } }
    assert_redirected_to commetar_url(@commetar)
  end

  test "should destroy commetar" do
    assert_difference("Commetar.count", -1) do
      delete commetar_url(@commetar)
    end

    assert_redirected_to commetars_url
  end
end
