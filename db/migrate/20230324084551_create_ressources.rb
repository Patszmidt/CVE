class CreateRessources < ActiveRecord::Migration[7.0]
  def change
    create_table :ressources do |t|
      t.float :epaisseur
      t.string :dimension
      t.belongs_to :matiere, null: false, foreign_key: true

      t.timestamps
    end
  end
end
