require "application_system_test_case"

class RessourcesTest < ApplicationSystemTestCase
  setup do
    @ressource = ressources(:one)
  end

  test "visiting the index" do
    visit ressources_url
    assert_selector "h1", text: "Ressources"
  end

  test "should create ressource" do
    visit ressources_url
    click_on "New ressource"

    fill_in "Dimension", with: @ressource.dimension
    fill_in "Epaisseur", with: @ressource.epaisseur
    fill_in "Matiere", with: @ressource.matiere_id
    click_on "Create Ressource"

    assert_text "Ressource was successfully created"
    click_on "Back"
  end

  test "should update Ressource" do
    visit ressource_url(@ressource)
    click_on "Edit this ressource", match: :first

    fill_in "Dimension", with: @ressource.dimension
    fill_in "Epaisseur", with: @ressource.epaisseur
    fill_in "Matiere", with: @ressource.matiere_id
    click_on "Update Ressource"

    assert_text "Ressource was successfully updated"
    click_on "Back"
  end

  test "should destroy Ressource" do
    visit ressource_url(@ressource)
    click_on "Destroy this ressource", match: :first

    assert_text "Ressource was successfully destroyed"
  end
end
