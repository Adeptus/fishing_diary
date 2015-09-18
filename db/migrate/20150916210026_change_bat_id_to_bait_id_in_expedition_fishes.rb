class ChangeBatIdToBaitIdInExpeditionFishes < ActiveRecord::Migration
  def change
    rename_column :expedition_fishes, :bat_id, :bait_id
  end
end
