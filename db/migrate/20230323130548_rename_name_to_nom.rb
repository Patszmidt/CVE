class RenameNameToNom < ActiveRecord::Migration[7.0]
  def change
    rename_column :clients, :name, :nom
  end
end
