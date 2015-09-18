class ChangeWaightInExpeditionFish < ActiveRecord::Migration
  def change
    change_column :expedition_fishes, :weight, :decimal, precision: 5, scale: 2
  end
end
