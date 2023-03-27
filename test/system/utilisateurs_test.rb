require "application_system_test_case"

class UtilisateursTest < ApplicationSystemTestCase
  setup do
    @utilisateur = utilisateurs(:one)
  end

  test "visiting the index" do
    visit utilisateurs_url
    assert_selector "h1", text: "Utilisateurs"
  end

  test "should create utilisateur" do
    visit utilisateurs_url
    click_on "New utilisateur"

    fill_in "Nom", with: @utilisateur.nom
    fill_in "Prenom", with: @utilisateur.prenom
    click_on "Create Utilisateur"

    assert_text "Utilisateur was successfully created"
    click_on "Back"
  end

  test "should update Utilisateur" do
    visit utilisateur_url(@utilisateur)
    click_on "Edit this utilisateur", match: :first

    fill_in "Nom", with: @utilisateur.nom
    fill_in "Prenom", with: @utilisateur.prenom
    click_on "Update Utilisateur"

    assert_text "Utilisateur was successfully updated"
    click_on "Back"
  end

  test "should destroy Utilisateur" do
    visit utilisateur_url(@utilisateur)
    click_on "Destroy this utilisateur", match: :first

    assert_text "Utilisateur was successfully destroyed"
  end
end
