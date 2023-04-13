class AddCommandeToAchats < ActiveRecord::Migration[7.0]
    def change
      add_reference :achats, :commande, foreign_key: true
    end
  end
  