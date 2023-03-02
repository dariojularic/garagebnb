class AddCityToGarages < ActiveRecord::Migration[7.0]
  def change
    add_column :garages, :city, :string
  end
end
