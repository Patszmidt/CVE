class AddDateDeLivraisonAndLivreToChantiers < ActiveRecord::Migration[7.0]
  def change
    add_column :chantiers, :date_de_livraison, :date
    add_column :chantiers, :livre, :boolean
  end
end
