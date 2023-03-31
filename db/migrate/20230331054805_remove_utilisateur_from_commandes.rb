class RemoveUtilisateurFromCommandes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :commandes, :utilisateur, null: false, foreign_key: true
  end
end
