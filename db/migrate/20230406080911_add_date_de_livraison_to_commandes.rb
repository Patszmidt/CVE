class AddDateDeLivraisonToCommandes < ActiveRecord::Migration[7.0]
  def change
    add_column :commandes, :date_de_livraison, :date
  end
end
