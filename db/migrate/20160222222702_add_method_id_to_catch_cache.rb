class AddMethodIdToCatchCache < ActiveRecord::Migration
  def change
    add_column :catch_caches, :method_id, :integer
  end
end
