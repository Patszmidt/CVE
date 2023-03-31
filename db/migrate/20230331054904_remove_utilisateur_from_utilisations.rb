class RemoveUtilisateurFromUtilisations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :utilisations, :utilisateur, null: false, foreign_key: true
  end
end
