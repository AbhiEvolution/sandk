require "application_system_test_case"

class TreatementtypesTest < ApplicationSystemTestCase
  setup do
    @treatementtype = treatementtypes(:one)
  end

  test "visiting the index" do
    visit treatementtypes_url
    assert_selector "h1", text: "Treatementtypes"
  end

  test "should create treatementtype" do
    visit treatementtypes_url
    click_on "New treatementtype"

    fill_in "Name", with: @treatementtype.name
    click_on "Create Treatementtype"

    assert_text "Treatementtype was successfully created"
    click_on "Back"
  end

  test "should update Treatementtype" do
    visit treatementtype_url(@treatementtype)
    click_on "Edit this treatementtype", match: :first

    fill_in "Name", with: @treatementtype.name
    click_on "Update Treatementtype"

    assert_text "Treatementtype was successfully updated"
    click_on "Back"
  end

  test "should destroy Treatementtype" do
    visit treatementtype_url(@treatementtype)
    click_on "Destroy this treatementtype", match: :first

    assert_text "Treatementtype was successfully destroyed"
  end
end
