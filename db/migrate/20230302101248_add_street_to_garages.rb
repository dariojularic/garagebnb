class AddStreetToGarages < ActiveRecord::Migration[7.0]
  def change
    add_column :garages, :street, :string
  end
end
