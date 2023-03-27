class CreateUtilisations < ActiveRecord::Migration[7.0]
  def change
    create_table :utilisations do |t|
      t.belongs_to :utilisateur, null: false, foreign_key: true
      t.belongs_to :chantier, null: false, foreign_key: true
      t.belongs_to :machine, null: false, foreign_key: true
      t.belongs_to :ressource, null: false, foreign_key: true
      t.date :date
      t.integer :quantite

      t.timestamps
    end
  end
end
