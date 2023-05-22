require "application_system_test_case"

class CommentarsTest < ApplicationSystemTestCase
  setup do
    @commentar = commentars(:one)
  end

  test "visiting the index" do
    visit commentars_url
    assert_selector "h1", text: "Commentars"
  end

  test "should create commentar" do
    visit commentars_url
    click_on "New commentar"

    fill_in "Comentar text", with: @commentar.comentar_text
    fill_in "User", with: @commentar.user_id
    click_on "Create Commentar"

    assert_text "Commentar was successfully created"
    click_on "Back"
  end

  test "should update Commentar" do
    visit commentar_url(@commentar)
    click_on "Edit this commentar", match: :first

    fill_in "Comentar text", with: @commentar.comentar_text
    fill_in "User", with: @commentar.user_id
    click_on "Update Commentar"

    assert_text "Commentar was successfully updated"
    click_on "Back"
  end

  test "should destroy Commentar" do
    visit commentar_url(@commentar)
    click_on "Destroy this commentar", match: :first

    assert_text "Commentar was successfully destroyed"
  end
end
