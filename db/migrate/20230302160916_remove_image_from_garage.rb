class RemoveImageFromGarage < ActiveRecord::Migration[7.0]
  def change
    remove_column :garages, :image, :string
  end
end
