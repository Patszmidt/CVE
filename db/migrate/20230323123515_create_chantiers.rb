class CreateChantiers < ActiveRecord::Migration[7.0]
  def change
    create_table :chantiers do |t|
      t.string :nom
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
