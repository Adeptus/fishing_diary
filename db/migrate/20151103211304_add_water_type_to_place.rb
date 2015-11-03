class AddWaterTypeToPlace < ActiveRecord::Migration
  def change
    add_column :places, :water_type, :string
  end
end
