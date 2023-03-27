require "application_system_test_case"

class UtilisationsTest < ApplicationSystemTestCase
  setup do
    @utilisation = utilisations(:one)
  end

  test "visiting the index" do
    visit utilisations_url
    assert_selector "h1", text: "Utilisations"
  end

  test "should create utilisation" do
    visit utilisations_url
    click_on "New utilisation"

    fill_in "Chantier", with: @utilisation.chantier_id
    fill_in "Date", with: @utilisation.date
    fill_in "Machine", with: @utilisation.machine_id
    fill_in "Quantite", with: @utilisation.quantite
    fill_in "Ressource", with: @utilisation.ressource_id
    fill_in "Utilisateur", with: @utilisation.utilisateur_id
    click_on "Create Utilisation"

    assert_text "Utilisation was successfully created"
    click_on "Back"
  end

  test "should update Utilisation" do
    visit utilisation_url(@utilisation)
    click_on "Edit this utilisation", match: :first

    fill_in "Chantier", with: @utilisation.chantier_id
    fill_in "Date", with: @utilisation.date
    fill_in "Machine", with: @utilisation.machine_id
    fill_in "Quantite", with: @utilisation.quantite
    fill_in "Ressource", with: @utilisation.ressource_id
    fill_in "Utilisateur", with: @utilisation.utilisateur_id
    click_on "Update Utilisation"

    assert_text "Utilisation was successfully updated"
    click_on "Back"
  end

  test "should destroy Utilisation" do
    visit utilisation_url(@utilisation)
    click_on "Destroy this utilisation", match: :first

    assert_text "Utilisation was successfully destroyed"
  end
end
