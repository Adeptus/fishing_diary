class RenameFieldInExpeditionFish < ActiveRecord::Migration
  def change
    remove_column :expedition_fishes, :fishing_type
    add_column :expedition_fishes, :method_id, :integer
  end
end
