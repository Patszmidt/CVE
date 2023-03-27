class CreateMatieres < ActiveRecord::Migration[7.0]
  def change
    create_table :matieres do |t|
      t.string :nom

      t.timestamps
    end
  end
end
