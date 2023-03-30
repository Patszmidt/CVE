class AddQuantiteToCommandes < ActiveRecord::Migration[7.0]
  def change
    add_column :commandes, :quantite, :integer
  end
end
