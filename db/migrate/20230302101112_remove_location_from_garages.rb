class RemoveLocationFromGarages < ActiveRecord::Migration[7.0]
  def change
    remove_column :garages, :location, :string
  end
end
