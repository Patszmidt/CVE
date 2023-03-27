class CreateUtilisateurs < ActiveRecord::Migration[7.0]
  def change
    create_table :utilisateurs do |t|
      t.string :prenom
      t.string :nom

      t.timestamps
    end
  end
end
