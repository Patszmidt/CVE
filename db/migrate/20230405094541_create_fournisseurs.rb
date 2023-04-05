class CreateFournisseurs < ActiveRecord::Migration[7.0]
  def change
    create_table :fournisseurs do |t|
      t.string :nom

      t.timestamps
    end
  end
end
