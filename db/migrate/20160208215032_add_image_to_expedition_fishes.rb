class AddImageToExpeditionFishes < ActiveRecord::Migration
  def change
    add_column :expedition_fishes, :image, :string
  end
end
