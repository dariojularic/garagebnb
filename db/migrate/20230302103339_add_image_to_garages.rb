class AddImageToGarages < ActiveRecord::Migration[7.0]
  def change
    add_column :garages, :image, :string
  end
end
