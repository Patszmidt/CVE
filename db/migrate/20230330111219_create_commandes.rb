class CreateCommandes < ActiveRecord::Migration[7.0]
  def change
    create_table :commandes do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.references :chantier, null: false, foreign_key: true
      t.references :ressource, null: false, foreign_key: true
      t.date :date_de_commande
      t.date :date_de_livraison
      t.boolean :livre

      t.timestamps
    end
  end
end
