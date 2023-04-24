class AddFormeToRessources < ActiveRecord::Migration[7.0]
  def change
    add_column :ressources, :forme, :string
  end
end
