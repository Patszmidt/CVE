class AddClotureToChantiers < ActiveRecord::Migration[7.0]
  def change
    add_column :chantiers, :cloture, :boolean
  end
end
