class AddFishTypeToFish < ActiveRecord::Migration
  def change
    add_column :fish, :fish_type, :string
  end
end
