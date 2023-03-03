class CreateGarages < ActiveRecord::Migration[7.0]
  def change
    create_table :garages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :city
      t.string :street
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
