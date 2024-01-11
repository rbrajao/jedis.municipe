require "application_system_test_case"

class MunicipesTest < ApplicationSystemTestCase
  setup do
    @municipe = municipes(:one)
  end

  test "visiting the index" do
    visit municipes_url
    assert_selector "h1", text: "Municipes"
  end

  test "should create municipe" do
    visit municipes_url
    click_on "New municipe"

    fill_in "Birthday", with: @municipe.birthday
    fill_in "Cns", with: @municipe.cns
    fill_in "Country code", with: @municipe.country_code
    fill_in "Cpf", with: @municipe.cpf
    fill_in "Email", with: @municipe.email
    fill_in "Mobile", with: @municipe.mobile
    fill_in "Name", with: @municipe.name
    check "Status" if @municipe.status
    click_on "Create Municipe"

    assert_text "Municipe was successfully created"
    click_on "Back"
  end

  test "should update Municipe" do
    visit municipe_url(@municipe)
    click_on "Edit this municipe", match: :first

    fill_in "Birthday", with: @municipe.birthday
    fill_in "Cns", with: @municipe.cns
    fill_in "Country code", with: @municipe.country_code
    fill_in "Cpf", with: @municipe.cpf
    fill_in "Email", with: @municipe.email
    fill_in "Mobile", with: @municipe.mobile
    fill_in "Name", with: @municipe.name
    check "Status" if @municipe.status
    click_on "Update Municipe"

    assert_text "Municipe was successfully updated"
    click_on "Back"
  end

  test "should destroy Municipe" do
    visit municipe_url(@municipe)
    click_on "Destroy this municipe", match: :first

    assert_text "Municipe was successfully destroyed"
  end
end
