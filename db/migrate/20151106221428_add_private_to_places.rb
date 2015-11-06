class AddPrivateToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :private, :boolean, default: false
  end
end
