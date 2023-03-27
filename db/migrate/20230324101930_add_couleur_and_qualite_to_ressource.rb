class AddCouleurAndQualiteToRessource < ActiveRecord::Migration[7.0]
  def change
    add_column :ressources, :couleur, :string
    add_column :ressources, :qualite, :string
  end
end
