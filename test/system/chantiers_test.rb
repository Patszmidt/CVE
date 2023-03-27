require "application_system_test_case"

class ChantiersTest < ApplicationSystemTestCase
  setup do
    @chantier = chantiers(:one)
  end

  test "visiting the index" do
    visit chantiers_url
    assert_selector "h1", text: "Chantiers"
  end

  test "should create chantier" do
    visit chantiers_url
    click_on "New chantier"

    fill_in "Client", with: @chantier.client_id
    fill_in "Nom", with: @chantier.nom
    click_on "Create Chantier"

    assert_text "Chantier was successfully created"
    click_on "Back"
  end

  test "should update Chantier" do
    visit chantier_url(@chantier)
    click_on "Edit this chantier", match: :first

    fill_in "Client", with: @chantier.client_id
    fill_in "Nom", with: @chantier.nom
    click_on "Update Chantier"

    assert_text "Chantier was successfully updated"
    click_on "Back"
  end

  test "should destroy Chantier" do
    visit chantier_url(@chantier)
    click_on "Destroy this chantier", match: :first

    assert_text "Chantier was successfully destroyed"
  end
end
