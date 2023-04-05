class RenameCommandeToAchat < ActiveRecord::Migration[7.0]
  def change
    rename_table :commandes, :achats
    rename_column :achats, :date_de_commande, :date_de_achat
  end
end
