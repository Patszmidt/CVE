class AddCheckedToUtilisations < ActiveRecord::Migration[7.0]
  def change
    add_column :utilisations, :checked, :boolean, default: false
  end
end
