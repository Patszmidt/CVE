require "application_system_test_case"

class MatieresTest < ApplicationSystemTestCase
  setup do
    @matiere = matieres(:one)
  end

  test "visiting the index" do
    visit matieres_url
    assert_selector "h1", text: "Matieres"
  end

  test "should create matiere" do
    visit matieres_url
    click_on "New matiere"

    fill_in "Nom", with: @matiere.nom
    click_on "Create Matiere"

    assert_text "Matiere was successfully created"
    click_on "Back"
  end

  test "should update Matiere" do
    visit matiere_url(@matiere)
    click_on "Edit this matiere", match: :first

    fill_in "Nom", with: @matiere.nom
    click_on "Update Matiere"

    assert_text "Matiere was successfully updated"
    click_on "Back"
  end

  test "should destroy Matiere" do
    visit matiere_url(@matiere)
    click_on "Destroy this matiere", match: :first

    assert_text "Matiere was successfully destroyed"
  end
end
