class CreateCommandes < ActiveRecord::Migration[7.0]
  def change
    create_table :commandes do |t|
      t.date :date
      t.references :fournisseur, null: false, foreign_key: true
      t.string :numero_de_commande
      t.boolean :livree

      t.timestamps
    end
  end
end
