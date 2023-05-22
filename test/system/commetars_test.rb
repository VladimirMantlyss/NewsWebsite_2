require "application_system_test_case"

class CommetarsTest < ApplicationSystemTestCase
  setup do
    @commetar = commetars(:one)
  end

  test "visiting the index" do
    visit commetars_url
    assert_selector "h1", text: "Commetars"
  end

  test "should create commetar" do
    visit commetars_url
    click_on "New commetar"

    fill_in "Comentar text", with: @commetar.comentar_text
    fill_in "User", with: @commetar.user_id
    click_on "Create Commetar"

    assert_text "Commetar was successfully created"
    click_on "Back"
  end

  test "should update Commetar" do
    visit commetar_url(@commetar)
    click_on "Edit this commetar", match: :first

    fill_in "Comentar text", with: @commetar.comentar_text
    fill_in "User", with: @commetar.user_id
    click_on "Update Commetar"

    assert_text "Commetar was successfully updated"
    click_on "Back"
  end

  test "should destroy Commetar" do
    visit commetar_url(@commetar)
    click_on "Destroy this commetar", match: :first

    assert_text "Commetar was successfully destroyed"
  end
end
