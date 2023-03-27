require "test_helper"

class UtilisationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @utilisation = utilisations(:one)
  end

  test "should get index" do
    get utilisations_url
    assert_response :success
  end

  test "should get new" do
    get new_utilisation_url
    assert_response :success
  end

  test "should create utilisation" do
    assert_difference("Utilisation.count") do
      post utilisations_url, params: { utilisation: { chantier_id: @utilisation.chantier_id, date: @utilisation.date, machine_id: @utilisation.machine_id, quantite: @utilisation.quantite, ressource_id: @utilisation.ressource_id, utilisateur_id: @utilisation.utilisateur_id } }
    end

    assert_redirected_to utilisation_url(Utilisation.last)
  end

  test "should show utilisation" do
    get utilisation_url(@utilisation)
    assert_response :success
  end

  test "should get edit" do
    get edit_utilisation_url(@utilisation)
    assert_response :success
  end

  test "should update utilisation" do
    patch utilisation_url(@utilisation), params: { utilisation: { chantier_id: @utilisation.chantier_id, date: @utilisation.date, machine_id: @utilisation.machine_id, quantite: @utilisation.quantite, ressource_id: @utilisation.ressource_id, utilisateur_id: @utilisation.utilisateur_id } }
    assert_redirected_to utilisation_url(@utilisation)
  end

  test "should destroy utilisation" do
    assert_difference("Utilisation.count", -1) do
      delete utilisation_url(@utilisation)
    end

    assert_redirected_to utilisations_url
  end
end
