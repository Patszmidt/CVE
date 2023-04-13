class CreateAchats < ActiveRecord::Migration[7.0]
    def change
      create_table :achats do |t|
        t.belongs_to :chantier, null: false, foreign_key: true
        t.belongs_to :ressource, null: false, foreign_key: true
        t.date :date_de_achat
        t.date :date_de_livraison
        t.boolean :livre
        t.integer :quantite
        t.string :commentaire
        t.belongs_to :user, null: false, foreign_key: true
        
        
        
        
  
        t.timestamps
      end
    end
  end
  