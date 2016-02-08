class AddMethodToExpeditionFishes < ActiveRecord::Migration
  def change
    add_column :expedition_fishes, :fishing_type, :string
  end
end
