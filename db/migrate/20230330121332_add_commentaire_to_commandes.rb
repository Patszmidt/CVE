class AddCommentaireToCommandes < ActiveRecord::Migration[7.0]
  def change
    add_column :commandes, :commentaire, :string
  end
end
